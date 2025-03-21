#!/bin/bash

cd ~/ScarletFiles
stow --dotfiles .
cd ~/

if ! command -v yay &> /dev/null;
then
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -r yay
fi

systemctl enable paccache.timer
systemctl start paccache.timer

# TODO ly install, grub theme, laptop app list, set gtk, font
echo "========================="
echo "=== App Installation  ==="
echo "========================="

echo -n "Install i3 rice apps? [Y/n]: "
read -n 1 $ans
echo
  ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]')
if [ "$ans" != "n" ];
then
  yay -Syuq --noconfirm --needed  i3-wm autotiling polybar picom-git zscroll-git dunst rofi-power-menu i3lock xss-lock
fi

echo -n "Install niri rice apps? [Y/n]: "
read -n 1 $ans
echo
  ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]')
if [ "$ans" != "n" ];
then
  yay -Syuq --noconfirm --needed  niri xwayland-satellite wl-mirror wpaperd fuzzel waybar xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring 
  dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'
fi

echo -n "Install personal apps? [Y/n]"
read -n 1 ans
echo
  ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]')
  if [ "$ans" != "n" ];
then
  # Apps for both setups
  yay -Syuq --noconfirm --needed audiorelay vesktop-bin vlc ncpamixer bluetui thunar qbittorrent btop obsidian ttf-cascadia-code-nerd ttf-nerd-fonts-symbols-mono git neovim github-cli fish kitty zen-browser-bin yazi-nightly-bin zoxide p7zip flameshot texlive zathura ly lazygit stow feh bibata-cursor-theme-bin nwg-look fzf cava
  systemctl enable ly.service
  chsg -s /bin/fish

  # Fish theme
  if ! ls ~/.local/share  | grep "omf"
  then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
    omf install clearance
    omf theme clearance
  fi

  nwg-look -a

  echo "Install desktop apps? [Y/n]: "
  read -n 1 ans
echo
  ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]')
  if [ "$ans" != "n" ];
  then
   yay -Syuq --noconfirm --needed mesa-git gamescope gamemode vulkan-icd-loader vulkan-radeon steam spotify spicetify pcsx2-latest-bin komikku krita
  fi

  echo "Install laptop apps? [Y/n]: "
  read -n 1 ans
echo
  ans=$(echo "$ans" | tr '[:upper:]' '[:lower:]')

  if [ "$ans" != "n" ];
  then
   yay -Syuq --noconfirm --needed ncspot 
  fi
fi

