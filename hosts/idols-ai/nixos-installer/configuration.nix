{pkgs, ...}: {
  # ssh-agent is used to pull my private secrets repo from github when deploying my nixos config.
  programs.ssh.startAgent = false;
  #######I - Kry set this hostname command. May need to be removed?###############
  networking.hostName = "Computer"
  #################################################################################
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    gnumake
    wget
    just # a command runner(replacement of gnumake in some cases)
    curl
    nix-output-monitor
  ];
  networking = {
    # configures the network interface(include wireless) via `nmcli` & `nmtui`
    networkmanager.enable = true;
    defaultGateway = "197.93.11.132";
  };
  system.stateVersion = "24.05";
}
