{
  config,
  pkgs,
  lib,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  ln = config.lib.file.mkOutOfStoreSymlink;
  lnDir = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    tmux
    fzf
    # neovim
    # nixfmt
    # nil
    shellcheck
    shfmt
    gnumake
    sxhkd
    dunst
    libnotify
    direnv
    git
    delta
  ];

  xdg = {
    enable = true;
    configFile."git".source = lnDir "${dotfiles}/.config/git";
    configFile."dunst/dunstrc".source = ln "${dotfiles}/.config/dunst/dunstrc";
    configFile."picom/picom.conf".source = ln "${dotfiles}/.config/picom/picom.conf";
    configFile."sxhkd/sxhkdrc".source = ln "${dotfiles}/.config/sxhkd/sxhkdrc";
    configFile."mimeapps.list".source = ln "${dotfiles}/.config/mimeapps.list";
    configFile."libvirt/libvirt.conf".source = ln "${dotfiles}/.config/libvirt/libvirt.conf";
    # configFile."tmux/tmux.conf".source = "${dotfiles}/.config/tmux/tmux.conf";
    configFile."zathura/zathurarc".source = ln "${dotfiles}/.config/zathura/zathurarc";
    # configFile."user-dirs.dirs".source = "${dotfiles}/.config/user-dirs.dirs";
    # configFile."user-dirs.locale".source = "${dotfiles}/.config/user-dirs.locale";
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/dt";
      download = "${config.home.homeDirectory}/dl";
      documents = "${config.home.homeDirectory}/docs";
      pictures = "${config.home.homeDirectory}/pix";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/media/vids";
      music = "${config.home.homeDirectory}/media/music";
      publicShare = "${config.home.homeDirectory}/media/pub";
    };
  };

  # home.file.".config/tmux".source = ln $"

  home.file.".editorconfig".source = ln "${dotfiles}/.editorconfig";

  # xdg.mimeApps.defaultAplications = {
  #   "text/plain" = [ "nvim.desktop" ];
  #   # "aplication/pdf" = [ "zathura.desktop" ];
  #   "image/*" = [ "sxiv.desktop" ];
  #   "video/*" = [ "mpv.desktop" ];
  # };

  # programs.git = {
  #   enable = true;
  #   userName = "s4izh";
  #   userEmail = "sergiosanz234@gmail.com";
  #   extraConfig = {
  #     init = {
  #       defaultBranch = "main";
  #     };
  #   };
  # };

  # home.sessionVariables = {
  #   HISTFILE = "{xdg.dataHome}/bash/bash_history";
  # };

  # home.sessionVariables = {
  #   EDITOR = "nvim";
  #   TERMINAL = "alacritty";
  #   BROWSER = "firefox";
  #   READER = "zathura";
  #   SUDO_ASKPASS = "dmenupass";
  #   MANPAGER = "nvim +Man!";
  # };

  # home.shellAliases = {
  #   ts = "${scripts}/tmux/tmux-sessionizer";
  # };

  # programs.zsh = {
  #   enable = true;
  #   dotDir = ".config/zsh";
  #   enableCompletion = true;
  #   enableSyntaxHighlighting = true;
  #   # defaultKeymap = "vicmd";
  #   history.path = "$ZDOTDIR/zsh/zsh_history";
  # };

  # xdg.configFile."zsh/alias".source = "${dotfiles}/.config/zsh/alias";
  # xdg.configFile."zsh/functions".source = "${dotfiles}/.config/zsh/functions";

  # services.dwm-status = {
  #   enable = true;
  #   order = [
  #     "audio"
  #     "battery"
  #     "cpu_load"
  #   ];
  # };

  # services.dunst = {
  #   enable = true;
  #   dunst.configFile = "${dotfiles}/.config/dunst/dunstrc";
  # };

  # xdg.configFile.<name>.recursive

  # home.file.".ssh/config".source = ./.ssh/config;

  # programs.ssh = {
  #   enable = true;
  #   matchBlocks = {
  #     "github.com" = {
  #       hostname = "github.com";
  #       user = "git";
  #       identityFile = "~/.ssh/github";
  #     };
  #     "repo.fib.upc.es" = {
  #       hostname = "repo.fib.upc.es";
  #       user = "git";
  #       identityFile = "~/.ssh/repofib";
  #     };
  #     "zen" = {
  #       hostname = "192.168.1.137";
  #       user = "sergio";
  #       identityFile = "~/.ssh/zen";
  #     };
  #     "pti" = {
  #       hostname = "nattech.fib.upc.edu";
  #       user = "alumne";
  #       port = 22040;
  #     };
  #     "sistemes" = {
  #       hostname = "192.168.122.10";
  #       user = "alumne";
  #       identityFile = "~/.ssh/sistemes";
  #       port = 22;
  #       forwardX11 = true;
  #       forwardX11Trusted = true;
  #     };
  #   };
  # };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-gtk3;
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
      # name = "Qogir";
      # package = pkgs.qogir-theme;
    };
    iconTheme = {
      name = "Qogir-dark";
      # package = pkgs.papirus-icon-theme;
      package = pkgs.qogir-icon-theme;
    };
    cursorTheme = {
      name = "Qogir";
      package = pkgs.qogir-icon-theme;
    };
    font = {
      name = "monospace";
      size = 10;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk3.bookmarks = [
      "file:///mnt"
      "file:///home/sergio/notes"
      "file:///home/sergio/uni/mei"
      "file:///home/sergio/uni/gei"
    ];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    # "org/gnome/desktop/wm/preferences" = {
    #   button-layout = "appmenu";
    # };
  };

  # programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.stateVersion = "23.11";
}
