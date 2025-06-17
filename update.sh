GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Jorink's dots update script${NC}"
sudo echo -e "${GREEN}Cloning repository${NC}"
git lfs install
git clone https://github.com/MJorink/hypr-dotfiles.git $HOME/hypr-dotfiles-update
cd $HOME/hypr-dotfiles-update

echo -e "${GREEN}Copying new configs${NC}"
sudo cp -r .config $HOME
sudo cp -r .icons $HOME
sudo cp -r .themes $HOME
sudo cp -r .zshrc $HOME

echo -e "${GREEN}Configs updated!${NC}"

echo -e "${GREEN}Cleaning up${NC}"
cd $HOME
sudo rm -r $HOME/hypr-dotfiles-update
sudo rm -r $HOME/hypr-dotfiles
sleep 1
