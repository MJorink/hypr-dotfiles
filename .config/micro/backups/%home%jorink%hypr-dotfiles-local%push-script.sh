sudo echo Removing possible old files
sudo rm -r $HOME/hypr-dotfiles-local/.config
sudo rm -r $HOME/hypr-dotfiles-local/.themes
sudo rm -r $HOME/hypr-dotfiles-local/.icons
sudo rm -r $HOME/hypr-dotfiles


echo Copying new files
sudo cp -r $HOME/.config/Thunar $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/fastfetch $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/gtk-3.0 $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/gtk-4.0 $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/hypr $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/kitty $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/nwg-look $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/rofi $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/swappy $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/swaync $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/wallust $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/waybar $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/wlogout $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/xfce4 $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/Kvantum $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/cava $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/qt5ct $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/qt6ct $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/micro $HOME/hypr-dotfiles-local/.config
sudo cp -r $HOME/.config/wallpapers $HOME/hypr-dotfiles-local/.config/wallpapers
sudo cp -r $HOME/.themes $HOME/hypr-dotfiles-local/
sudo cp -r $HOME/.icons $HOME/hypr-dotfiles-local/


echo Cloning repository
git clone https://github.com/MJorink/hypr-dotfiles.git $HOME/hypr-dotfiles
sleep 5

echo Setting up git
cd $HOME/hypr-dotfiles
git init
sudo cp -r $HOME/hypr-dotfiles-local/.config $HOME/hypr-dotfiles/
sudo cp -r $HOME/hypr-dotfiles-local/.themes $HOME/hypr-dotfiles/
sudo cp -r $HOME/hypr-dotfiles-local/.icons $HOME/hypr-dotfiles/
sudo cp -r $HOME/hypr-dotfiles-local/copy.sh $HOME/hypr-dotfiles/
git lfs install
git lfs track "*.gif"
git lfs track "*.wallpaper_current"
git lfs track "*.wallpaper_modified"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
git remote set-url origin git@github.com:MJorink/hypr-dotfiles.git

echo Adding .gitattributes
sudo git add .gitattributes

# Commit here to update .gitattributes, if needed.
#echo Commiting .gitattributes
#sudo git commit -m "Update .gitattributes"

#echo Pushing .gitattributes commit
#git lfs push --all origin main
#git push -u origin main

#^ Comment out everything else under here if you are committing here.

echo Adding wallpapers
git add .config/wallpapers/*.gif
git add .config/hypr/wallpaper_effects/.wallpaper_current
git add .config/hypr/wallpaper_effects/.wallpaper_modified

echo Adding .config folders
sudo git add .config/Kvantum
sudo git add .config/Thunar
sudo git add .config/cava
sudo git add .config/fastfetch
sudo git add .config/gtk-3.0
sudo git add .config/gtk-4.0
sudo git add .config/hypr
sudo git add .config/kitty
sudo git add .config/micro
sudo git add .config/nwg-look
sudo git add .config/qt5ct
sudo git add .config/qt6ct
sudo git add .config/rofi
sudo git add .config/swappy
sudo git add .config/swaync
sudo git add .config/wallust
sudo git add .config/waybar
sudo git add .config/wlogout
sudo git add .config/xfce4

echo Adding copy.sh script
sudo git add ./copy.sh

echo Adding Themes/Icons
sudo git add .themes
sudo git add .icons

echo Setting global username/email
sudo git config --global user.name "MJorink"
sudo git config --global user.email "maxjorink@gmail.com"

echo Committing update
sudo git commit -m  "Update Config"

echo Pushing commit
git push -u origin main
