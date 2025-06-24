GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Jorink's dots update script${NC}"
sudo echo -e "${GREEN}Cloning repository${NC}"
git lfs install
git clone https://github.com/MJorink/hypr-dotfiles.git $HOME/hypr-dotfiles-update
cd $HOME/hypr-dotfiles-update

echo -e "${GREEN}Backing up user configs${NC}"
sudo cp -r $HOME/.config/hypr/UserConfigs $HOME/.config/UserConfigs-Backup

echo -e "${GREEN}Copying new configs${NC}"
sudo cp -r .config $HOME
sudo cp -r .icons $HOME
sudo cp -r .themes $HOME
sudo cp -r .zshrc $HOME

echo -e "${GREEN}Restoring UserKeybinds from backup${NC}"
sudo cp -r $HOME/.config/UserConfigs-Backup/UserKeybinds.conf $HOME/.config/hypr/UserConfigs

echo -e "${GREEN}Your UserKeybinds should be restored, be sure to compare all your $HOME/.config/hypr/UserConfigs files with the files in $HOME/.config/UserConfigs-Backup and make changes again if you want to.${NC}"

echo -e "${GREEN}Configs updated!${NC}"

echo -e "${GREEN}Cleaning up${NC}"
cd $HOME
sudo rm -r $HOME/hypr-dotfiles-update
sudo rm -r $HOME/hypr-dotfiles
sleep 1
