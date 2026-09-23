{
  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Daphne Lucia";
        email = "38116582+daphnelucia@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
    
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraConfig = ''
    set relativenumber
    set tabstop=4
    set shiftwidth=4
    set nowrap
    '';
  };
    
  programs.nix-your-shell = {
    enable = true;
    enableFishIntegration = true;
  };

  home.file.".config/fish/config.fish".source = ./config/fish/config.fish;
        
  home.stateVersion = "26.05";
} 
