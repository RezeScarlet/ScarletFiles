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


alias ":q"="exit"
end

zoxide init fish | source
alias "cd"="z"
