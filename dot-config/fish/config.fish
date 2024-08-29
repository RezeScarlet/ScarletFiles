if status --is-interactive
  set fish_greeting

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
