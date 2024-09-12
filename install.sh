if ! command -v yay
then
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -r yay
fi
if ! ls ~/.local/share  | grep "omf"
then
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi
yay -Syuq --noconfirm --needed stow git neovim github-cli fish zen-browser-bin yazi zoxide p7zip i3-wm autotiling polybar picom-git flameshot ttf-cascadia-code-nerd ttf-nerd-fonts-symbols-mono zscroll-git dunst rofi-power-menu i3lock xss-lock texlive zathura
cd ~/ScarletFiles
stow --dotfiles . 
