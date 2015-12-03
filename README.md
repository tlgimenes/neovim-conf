# Neovim Conf
This repository contains configuration files for neovim as well as simple installer

# What is Neovim ?
Neovim is the next generation of the vim text editor. For more information please visit the [official webpage](https://neovim.io/)

# Install
## Using the installer
For installing the configuration files using the installer just go to the repository folder and type:
```
./install.sh
```
  
Then open neovim and type
```
:PlugInstall
```
  
If no errors occur you should be ready to go

## Manual Install
For installing manually, you just need to place the "nvim" folder in the right place for the current user. Open a terminal and type
```
cd ~/.config
ln -s path/to/nvim/folder .
```

Then open neovim and type
```
:PlugInstall
```
  
If no errors occur you should be ready to go

##### Thanks for using neovim-conf configuration files. Any suggestions are welcome !
