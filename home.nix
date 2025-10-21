{ config, pkgs, ... }:

{
  home.username = "cuckboi";
  home.homeDirectory = "/etc/nixos/mynixfiles";
  programs.git.enable = true;
  home.stateVersion = "25.05";

  programs.fish = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos faggot";
    };
  };
}
