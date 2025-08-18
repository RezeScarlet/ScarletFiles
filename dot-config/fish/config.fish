if status --is-interactive
  set fish_greeting

  # When yazi opened with yy closes it leaves the term on the right directory
  function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      z "$cwd"
    end
    rm -f -- "$tmp"
  end

  set -x JAVA_HOME /usr/lib/jvm/java-24-openjdk
  set -x PATH $PATH $JAVA_HOME/bin
  set -gx EDITOR nvim

  alias :q "exit"
  alias v "nvim"
  alias y "yay --noconfirm && flatpak update"
  alias clean "yay -Yc"
  alias bean "wmname LG3D && netbeans"

end

zoxide init fish | source
alias "cd"="z"

# >>> conda initialize >>>
function conda
    if test -f /opt/miniconda3/bin/conda
        eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
        set -x CRYPTOGRAPHY_OPENSSL_NO_LEGACY 1
    else
        echo "Conda not found"
    end
end
# <<< conda initialize <<<

