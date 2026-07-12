{ pkgs, ... }:

{
  # Binary
  programs.ghidra = {
    enable = true;
    gdb = true;
  };

  environment.systemPackages = with pkgs; [
    #binwalk
    #stegsolve
    #john
    #wireshark
    #tshark
    #python313Packages.pyshark
    #burpsuite
    #postman
    #ht
    ltrace
    strace
    gdb # Gonna try to do pwndbg wrapper if it doesn't exist
    pwntools
    #python314Packages.ropper
    patchelf
    elfutils
    # something about ruby-dev
    one_gadget
    #rubyPackages.seccomp-tools
    #python314Packages.pycryptodome # maybe better with venv
    # many time pad
  ];
}
