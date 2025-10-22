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
<<<<<<< HEAD:home.nix
      fc = "sudo nano ~/.config/fish/config.fish";
      nc = "nano /home/cuckboi/mynixfiles/configuration.nix";
=======
      fc = "nano ~/.config/fish/config.fish";
>>>>>>> refs/remotes/origin/main:home/cuckboi.nix
    };
  };
}
