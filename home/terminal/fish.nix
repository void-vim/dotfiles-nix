{
  programs.fish = {
    enable = true;
    shellAliases = {
      v = "nvim";
      nb = "sudo nixos-rebuild switch --flake .#jee";
      lsbig = "du -ah ./ | sort -rh | head -n 20";

      ga = "git add $1";
      gc = "git commit -m $1";
      gac = "git add . && git commit -m $1";
      gs = "git status --short";
      gl = "git log --oneline --graph --decorate";
      gck = "git checkout $1";
      grs = "git remote set-url origin $1";
      gps = "git push origin $2";
      gpl = "git pull origin $1";

      nrd = "npm run dev";
      nrs = "npm run start";
      nrb = "npm run build";
      nrf = "npm run format";
      prd = "pnpm run dev";
      prs = "pnpm run start";
      prb = "pnpm run build";
      prf = "pnpm run format";

      zrb = "zig run build";
      zr = "zig run";
      zb = "zig build";
    };
    interactiveShellInit = ''
      set -U fish_greeting
    '';
    functions.rm = {
      description = "Require sudo authentication before rm -rf";
      body = ''
        if status is-command-substitution
          command rm $argv
          return
        end

        set need_sudo 0
        for arg in $argv
          if string match -qr -- "-.*[rf].*" $arg
            set need_sudo 1
            break
          end
        end

        if test $need_sudo -eq 1
          echo "Authentication required for rm -rf"
          sudo -v || return 1
        end

        for target in $argv
          if test "$target" = "/" -o "$target" = "~" -o "$target" = "$HOME"
            echo "Refusing to rm -rf critical path: $target"
            return 1
          end
        end

        command rm $argv
      '';
    };
  };
}
