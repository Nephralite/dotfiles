{ config, pkgs, lib, ...}:

{
  home.username = "jade";
  home.homeDirectory = "/home/jade";

  home.packages = with pkgs; [
    neofetch
    zip
    unzip
    fzf
    nap
    which
    btop
  ];

  programs.git = {
    enable = true;
    userName = "Jade Ellingworth";
    userEmail = "jade.ellingworth@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    #TODO bashrc goes here
    #bashrcExtra = ./configs/.bashrc;

    #TODO move aliases
    shellAliases = {
      please="sudo !!";
      fullscreen="xrandr --output Virtual-1 --mode 1920x1080";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = lib.fileContents ./configs/init.vim;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      dracula-nvim #colour theme
      nerdtree #file manager
      vim-surround #parenthesis tool
      ale # linting engine
    ];
  };


  #minimum compatible version of home manager
  home.stateVersion = "25.05";
}
