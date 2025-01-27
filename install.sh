if ! command -v yay
then
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -r yay
fi


# TODO ly install, grub theme, laptop app list
echo "========================="
echo "=== App Installation  ==="
echo "========================="

echo "Install i3 rice apps? [Y/n]: "
read -n 1 ans
if ans != "n" || ans != "N"
then
  yay -Syuq --noconfirm --needed  i3-wm autotiling polybar picom-git zscroll-git dunst rofi-power-menu i3lock xss-lock 
fi

echo "Install personal apps? [Y/n]"
read -n 1 ans
if ans != "n" || ans != "N"
then
  # Apps for both setups
  yay -Syuq --noconfirm --needed audiorelay vesktop-bin vlc ncpamixer bluetui thunar qbittorrent btop obsidian ttf-cascadia-code-nerd ttf-nerd-fonts-symbols-mono stow git neovim github-cli fish zen-browser-bin yazi-nightly-bin zoxide p7zip flameshot texlive zathura ly lazygit
  systemctl enable ly.service

  # Fish theme
  if ! ls ~/.local/share  | grep "omf"
  then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
  fi

  echo "Install desktop apps? [Y/n]: "
  read -n 1 ans
  if ans != "n" || ans != "N"
  then
   yay -Syuq --noconfirm --needed mesa-git gamescope gamemode vulkan-icd-loader vulkan-radeon steam spotify pcsx2-latest-bin komikku krita
  fi

  echo "Install laptop apps? [Y/n]: "
  read -n 1 ans
  if ans != "n" || ans != "N"
  then
   yay -Syuq --noconfirm --needed ncspot 
  fi
fi

cd ~/ScarletFiles
stow --dotfiles .
