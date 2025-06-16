#echo -e "${GREEN}${NC}"

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Arch-Hypr-Install.sh${NC}"

clear

echo -e "${GREEN}Installing base-devel${NC}"
sudo pacman -S --noconfirm base-devel

echo -e "${GREEN}Installing archlinux-keyring${NC}"
sudo pacman -S --noconfirm archlinux-keyring

echo -e "${GREEN}Installing findutils${NC}"
sudo pacman -S --noconfirm findutils

echo -e "${GREEN}Setting up pacman.conf${NC}"
pacman_conf="/etc/pacman.conf"

lines_to_edit=(
    "Color"
    "CheckSpace"
    "VerbosePkgLists"
    "ParallelDownloads"
)

for line in "${lines_to_edit[@]}"; do
    if grep -q "^#$line" "$pacman_conf"; then
        sudo sed -i "s/^#$line/$line/" "$pacman_conf"
        echo "Uncommented: $line ${RESET}" 2>&1
    else
        echo "$line is already uncommented. ${RESET}" 2>&1
    fi
done

if grep -q "^ParallelDownloads" "$pacman_conf" && ! grep -q "^ILoveCandy" "$pacman_conf"; then
    sudo sed -i "/^ParallelDownloads/a ILoveCandy" "$pacman_conf"
    echo "Added ${MAGENTA}ILoveCandy${RESET} after ${MAGENTA}ParallelDownloads${RESET}. ${RESET}" 2>&1 | tee -a "$LOG"
else
    echo "It seems ${YELLOW}ILoveCandy${RESET} already exists ${RESET} moving on.." 2>&1 | tee -a "$LOG"
fi

echo -e "${GREEN}Installing yay${NC}"
cd $HOME
git clone https://aur.archlinux.org/yay.git
cd yay
sudo makepkg -si --noconfirm

echo -e "${GREEN}Updating system with yay${NC}"
yay -Syu --noconfirm

echo -e "${GREEN}Setting up packages${NC}"
sudo pacman -R --noconfirm aylurs-gtk-shell
sudo pacman -R --noconfirm dunst
sudo pacman -R --noconfirm cachyos-hyprland-settings
sudo pacman -R --noconfirm mako
sudo pacman -R --noconfirm rofi
sudo pacman -R --noconfirm wallust-git
sudo pacman -R --noconfirm rofi-lbonn-wayland
sudo pacman -R --noconfirm rofi-lbonn-wayland-git

yay -S --noconfirm bc
yay -S --noconfirm cliphist
yay -S --noconfirm curl
yay -S --noconfirm grim
yay -S --noconfirm gvfs
yay -S --noconfirm gvfs-mtp
yay -S --noconfirm hyprpolkitagent
yay -S --noconfirm imagemagick
yay -S --noconfirm inxi
yay -S --noconfirm jq
yay -S --noconfirm kitty
yay -S --noconfirm kvantum
yay -S --noconfirm libspng
yay -S --noconfirm nano
yay -S --noconfirm network-manager-applet
yay -S --noconfirm pamixer
yay -S --noconfirm pavucontrol
yay -S --noconfirm playerctl
yay -S --noconfirm python-requests
yay -S --noconfirm python-pyquery
yay -S --noconfirm qt5ct
yay -S --noconfirm qt6ct
yay -S --noconfirm qt6-svg
yay -S --noconfirm rofi-wayland
yay -S --noconfirm slurp
yay -S --noconfirm swappy
yay -S --noconfirm swaync
yay -S --noconfirm swww
yay -S --noconfirm unzip
yay -S --noconfirm wallust
yay -S --noconfirm waybar
yay -S --noconfirm wget
yay -S --noconfirm wl-clipboard
yay -S --noconfirm wlogout
yay -S --noconfirm xdg-user-dirs
yay -S --noconfirm xdg-utils
yay -S --noconfirm yad
yay -S --noconfirm brightnessctl
yay -S --noconfirm btop
yay -S --noconfirm cava
yay -S --noconfirm loupe
yay -S --noconfirm fastfetch
yay -S --noconfirm gnome-system-monitor
yay -S --noconfirm mousepad
yay -S --noconfirm mpv
yay -S --noconfirm mpv-mpris
yay -S --noconfirm nvtop
yay -S --noconfirm nwg-look
yay -S --noconfirm nwg-displays
yay -S --noconfirm pacman-contrib
yay -S --noconfirm pipewire
yay -S --noconfirm wireplumber
yay -S --noconfirm pipewire-audio
yay -S --noconfirm pipewire-alsa
yay -S --noconfirm pipewire-pulse
yay -S --noconfirm sof-firmware

systemctl --user enable --now pipewire.socket pipewire-pulse.socket wireplumber.service
systemctl --user enable --now pipewire.service

yay -S --noconfirm adobe-source-code-pro-fonts
yay -S --noconfirm noto-fonts-emoji
yay -S --noconfirm otf-font-awesome
yay -S --noconfirm ttf-droid
yay -S --noconfirm ttf-fire-code
yay -S --noconfirm ttf-fantasque-nerd
yay -S --noconfirm ttf-jetbrains-mono
yay -S --noconfirm ttf-jetbrains-mono-nerd
yay -S --noconfirm ttf-victor-mono
yay -S --noconfirm noto-fonts

yay -S --noconfirm hyprland
yay -S --noconfirm hypridle
yay -S --noconfirm hyprlock

yay -S --noconfirm nvidia-open-dkms
yay -S --noconfirm nvidia-settings
yay -S --noconfirm nvidia-utils
yay -S --noconfirm libva
yay -S --noconfirm libva-nvidia-driver

if grep -qE '^MODULES=.*nvidia. *nvidia_modeset.*nvidia_uvm.*nvidia_drm' /etc/mkinitcpio.conf; then
  echo "Nvidia modules already included in /etc/mkinitcpio.conf" 2>&1 | tee -a "$LOG"
else
  sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf 2>&1 | tee -a "$LOG"
  echo "Nvidia modules added in /etc/mkinitcpio.conf"
fi

