{ config, pkgs, lib, ... }:

let
  cfg = config.frigate;
  camera-ip = "192.168.1.102"; 
  frigateConfig = pkgs.writeText "frigate.yml" ''

    mqtt:
      host: 127.0.0.1
      port: 1883
      user: frigate
      password: '{FRIGATE_MQTT_PASSWORD}'

    ffmpeg:
      input_args: preset-rstp-generic

    detectors:
      cpu:
        type: cpu

    database:
      path: /media/frigate/frigate.db

    go2rtc:
      streams:
        mountain_reolink_main:
          - rtsp://{FRIGATE_RTSP_USER}:{FRIGATE_RTSP_PASSWORD}@${camera-ip}:554/Preview_01_main
        mountain_reolink_sub:
          - rtsp://{FRIGATE_RTSP_USER}:{FRIGATE_RTSP_PASSWORD}@${camera-ip}:554/Preview_01_sub

    cameras:
      mountain_reolink:
        onvif:
          host: ${camera-ip}
          port: 8000
          user: '{FRIGATE_RTSP_USER}'
          password: '{FRIGATE_RTSP_PASSWORD}'
        ffmpeg:
          inputs:
            - path: rtsp://127.0.0.1:8554/mountain_reolink_main
              input_args: preset-rtsp-restream
              roles: [ record ]
            - path: rtsp://127.0.0.1:8554/mountain_reolink_sub
              input_args: preset-rtsp-restream
              roles: [ detect ]
        detect:
          enabled: true
        objects:
          track: [ person, dog, cat ]
        record:
          enabled: true
          alerts:
            retain:
              days: 7
              mode: all
          detections:
            retain:
              days: 7
              mode: all
        snapshots:
          enabled: true
          retain:
            default: 7
  '';
in
{
  options.frigate.enable = lib.mkEnableOption "Enable Frigate NVR";

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers.containers.frigate = {
      image = "ghcr.io/blakeblackshear/frigate:stable";
      volumes = [
        "/storage/frigate/config:/config"
        "${frigateConfig}:/config/config.yml:ro"
        "/storage/frigate/media:/media/frigate"
      ];
      environment = {
        TZ = "Europe/Rome";
        FRIGATE_MQTT_HOST = "127.0.0.1";
        FRIGATE_MQTT_USER = "frigate";
        FRIGATE_RTSP_USER = "admin";
      };
      environmentFiles = [ config.age.secrets."frigate-env.age".path ];
      extraOptions = [
        "--network=host"
        "--shm-size=512mb"
      ];
    };

    networking.firewall.allowedTCPPorts = [ 5000 ];
    systemd.tmpfiles.rules = [
      "d /storage/frigate/config 0750 root root -"
      "d /storage/frigate/media 0750 root root -"
    ];
    systemd.services."podman-frigate".after = [ "zfs-mount-storage.service" ];
    age.secrets."frigate-env.age".file = "/Nixos/secrets/frigate-env.age";
  };
}
