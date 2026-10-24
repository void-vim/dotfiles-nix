{ ... }:

{
  xdg.configFile."tridactyl/tridactylrc".text = ''
    " --- Gruvbox Dark Tridactyl Config ---

    " Keymaps
    bind j scrollline 20
    bind k scrollline -20
    bind J tabnext
    bind K tabprev

   " Page Jumping & History Navigation
    bind gg scrolltop
    bind G scrollbottom
    bind H gobrief
    bind L goforward

    " Hint characters optimized for home row
    set hintchars a s d f g h j k l

    " Gruvbox GUI overrides
    colors dark
    guiset bg #282828
    guiset fg #ebdbb2

    " Custom command aliases
    command nixsearch tabopen https://search.nixos.org/packages?channel=unstable&query=
  '';
}
