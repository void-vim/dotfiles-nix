{ ... }:

{
  xdg.configFile."tridactyl/tridactylrc".text = ''
    bind j scrollline 20
    bind k scrollline -20
    bind J tabprev
    bind K tabnext

    bind H gobrief
    bind L goforward

    " Hint characters optimized for home row
    set hintchars a s d f g h j k l

    " Gruvbox GUI overrides
    colors dark
    guiset bg #282828
    guiset fg #ebdbb2
  '';
}
