# hypr-dotfiles
My personal dotfiles for Hyprland

I used JaKooLit's dotfiles as a base, then started configuring to my liking.
Check him out here: https://github.com/JaKooLit

NOTE:
    Cloning hypr-dotfiles may appear to be "stuck" at some point, this is most likely not the case, it will just take a good     while for it to finish.

------------------------------------------------------------
Installation:

For arch / arch-based distros just use this guide. 

For any other distro, use the script for your distro from JaKooLit, then after you are done with that script, follow the Manual Installation part on this page.

Dependencies: 
- archinstall minimum (or similar)
- git
- git-lfs

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
- git
- git-lfs
- (Note that you need a bunch of packages to get the intended experience for these dotfiles, scripted install is recommended) 

If you came here after using a JaKooLit script, continue here:

If you have everything ready to go, follow these steps:

    cd $HOME
    git clone https://github.com/MJorink/hypr-dotfiles
    cd hypr-dotfiles
    cp -r .config $HOME/
    reboot
    
    
------------------------------------------------------------
