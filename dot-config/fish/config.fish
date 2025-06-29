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

set -gx EDITOR nvim

alias ":q"="exit"
alias "v"="nvim"
end

zoxide init fish | source
alias "cd"="z"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# if test -f /opt/miniconda3/bin/conda
#     eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#   echo "1"
#     if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
#       echo "2"
#     else
#         set -x PATH "/opt/miniconda3/bin" $PATH
#     end
# end
function conda
    if test -f /opt/miniconda3/bin/conda
        eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
        set -x CRYPTOGRAPHY_OPENSSL_NO_LEGACY 1
    else
        echo "Conda not found"
    end
end
# <<< conda initialize <<<

