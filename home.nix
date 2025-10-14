{ config, pkgs, ... }:

{
  home.username = "cuckboi";
  home.homeDirectory = "/home/cuckboi";
  programs.git.enable = true;
  home.stateVersion = "25.05";

  programs.fish = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos faggot";
    };
  };
}
