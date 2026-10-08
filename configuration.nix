{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steamcmd"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
    "nvidia-x11"
    "nvidia-settings"    
    "obsidian"
    "davinci-resolve"
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  
  hardware.graphics.enable = true;

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  console = {
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.zerotierone = {
    enable = true;
    localConf = {
      physical = {
        "0.0.0.0/0" = {
          mtu = 800;
        };
      };
    };
  };
  
  services.flatpak.enable = true;
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.waybar.enable = true;
  programs.obs-studio.enableVirtualCamera = true;

  services.geoclue2.enable = true;
  location.provider = "geoclue2";
  
  services.greetd.enable = lib.mkDefault false;
  services.displayManager.defaultSession = lib.mkDefault "hyprland-uwsm";
  services.displayManager.ly = {
    enable = true;
    settings = {
      #animation = "dur_file";
      #dur_file_path = "${./config/example.dur}";
    };
  };

  hardware.steam-hardware.enable = true;
  services.udev = {
    packages = with pkgs; [
      game-devices-udev-rules
    ];
  };
  hardware.uinput.enable = true;

  services.xserver.xkb.layout = "latam,ru";
  services.xserver.xkb.options = "grp:win_space_toggle,caps:escape";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  users.users.lapochka = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; []; # defined in home manager
    shell = pkgs.fish;
  };

  documentation.dev.enable = true;
  
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
    helix
    wget
    git
    gh
    ntfs3g
    hyprshutdown
    emacs
    libqalculate
    ffmpeg
    unzip
    android-tools

    steamcmd
    pkgsi686Linux.gperftools

  ];
 
  fonts = {
    packages = with pkgs; [
      # fonts
      terminus_font
      liberation_ttf
      dejavu_fonts
      freefont_ttf
      libertinus
      noto-fonts
      cantarell-fonts
      open-sans
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      fira-code-symbols
      dina-font
      proggyfonts
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      comic-mono
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Comic Mono" ];  
      };
    };
  };
  
  system.stateVersion = "26.05";
}

