{ config, pkgs, ... }:

{
  home.username = "will";
  home.homeDirectory = "/home/will";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.neofetch
    pkgs.neovim
    pkgs.yazi
    pkgs.firefox
    pkgs.git
    pkgs.fuzzel
    pkgs.eww
    pkgs.mako
    pkgs.btop
    pkgs.ncspot
    pkgs.cava
    pkgs.nwg-look
    pkgs.bluetui
    pkgs.texliveFull
    pkgs.zathura
    pkgs.alacritty
    pkgs.vlc
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # EWW Config
    ".config/eww/eww.yuck".text = ''
      (defwidget idk [] (box :orientation "h" :halign "start" :space-evenly false "    󰁹 ${battery}%"))

      (defwidget media []
        (box :class "media" :orientation "h" :halign "center"
          {music != "" ? "󰎇 ${music}" : ""}
        )
      )

      (defwidget bits []
        (box :class "bits" :orientation "h" :space-evenly false :halign "end"
          "󰥔 ${time}"
        )
      )

      (defpoll battery :interval "10s"
        "cat /sys/class/power_supply/BAT1/capacity")

      (defpoll time :interval "10s"
        "date '+%H:%M %d %b'")
  

      (deflisten music :initial ""
        "playerctl --follow metadata --format '{{ artist }} - {{ title }}' || true")

      (defwidget bar []
        (centerbox :orientation "h" :class "bar"
          (idk)
          (media)
          (bits)))

      (defwindow status
        :monitor 0 
        :geometry (geometry :x "0%"
        :y "20px"
        :width "97%"
        :height "20px"
        :anchor "top center")
        :stacking "fg"
        :exclusive true
        :focusable false
      (bar))
    ''

    ".config/eww/eww.scss".text = ''
	*{ all: unset; }

      .bar { 
        background: #1e1e2e; 
        padding: 6px 10px;
        border-radius: 5px;
        font-family: "JetBrainsMono Nerd Font";
        color: #cad3f5;
      }

    ''

    # Fuzzel Config
    ".config/fuzzel/fuzzel.ini".text = ''
      [main]
      font=JetBrainsMono Nerd Font:size=12
      icons-enabled=false
      terminal=alacritty -e

      [colors]
      background=1e1e2eff
      text=cdd6f4ff
      prompt=bac2deff
      placeholder=7f849cff
      input=cdd6f4ff
      match=b4befeff
      selection=585b70ff
      selection-text=cdd6f4ff
      selection-match=b4befeff
      counter=7f849cff
      border=b4befeff
    ''

    # Ncspot Config
    ".config/ncspot/config.toml".text = ''
      initial_screen = "library"
      use_nerdfont = true
      notify = true
      shuffle = true
      repeat = "playlist"
      library_tabs = [ "tracks", "albums", "playlists" ]

      [theme]
      background = "#1E1E2E"
      primary = "#CDD6F4"
      secondary = "#BAC2DE"
      title = "#CDD6F4"
      playing = "#CBA6F7"
      playing_selected = "#CBA6F7"
      playing_bg = "#181818"
      highlight = "#B4BEFE"
      highlight_bg = "#181825"
      error = "#FFE4E4"
      error_bg = "#F38BA8"
      statusbar = "#181825"
      statusbar_progress = "#B4BEFE"
      statusbar_bg = "#B4BEFE"
      cmdline = "#F5C2E7"
      cmdline_bg = "#1E1E2E"
    ''
	
    # Mako Config
    ".config/mako/config".text = ''
      font=JetBrainsMono Nerd Font
      background-color=#181825FF
      text-color=#CDD6F4FF
      border-color=#B4BEFEFF
      border-radius=10
      default-timeout=3000
      anchor=bottom-right
      outer-margin=20,10
    ''
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
