# hypr-dotfiles
My personal dotfiles for Hyprland

I used JaKooLit's dotfiles as a base, then started configuring to my liking.
Check him out here: https://github.com/JaKooLit

------------------------------------------------------------
Installation:

For arch / arch-based distros use this guide, for any other distro use a script from JaKooLit, then after you installed everything from that script, follow the Manual Installation part on this page.

Dependencies: 
- Archinstall minimum (or similar)
- Git

Steps:

    git clone --depth=1 https://github.com/MJorink/Arch-Hyprland.git ~/Arch-Hyprland
    cd ~/Arch-Hyprland
    chmod +x install.sh
    ./install.sh

------------------------------------------------------------

------------------------------------------------------------
Manual Installation:

Dependencies:

- Hyprland
- Git
- (Note that you need a bunch of packages to get the intended experience for these dotfiles, scripted install is recommended) 


If you have everything ready to go, follow these steps:

    cd $HOME
    
    git clone https://github.com/MJorink/hypr-dotfiles
    
    cd hypr-dotfiles
    
    cp -r .config $HOME/
    
    reboot
    
    
------------------------------------------------------------
