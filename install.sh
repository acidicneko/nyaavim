#!/bin/bash

config="$HOME/.config/nvim"
data="$HOME/.local/share/nvim"

config_bak="$HOME/.config/nvim_bak"
data_bak="$HOME/.local/share/nvim_bak"


create_backup () {
	if [ -f  "$config" ] ; then
		echo Backing up current Neovim configuration...
		mv "$config" "$config_bak"
		echo Configuration backed up to "$config_bak"
		echo Done!
	fi
	
	if [ -f  "$data" ] ; then
		echo Backing up current Neovim data...
		mv "$data" "$data_bak"
		echo Configuration backed up to "$data_bak"
		echo Done!
	fi
}

download_files () {
	if [ ! -f /bin/git ] ; then
		echo ERROR: Please install git in order to install Nyaavim!
	fi
	git clone https://github.com/clawbhaiya/nyaavim.git "$config"
}

install_vim_plug () {
	echo Installing vim-plug...
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	if [ $? == 0 ] ; then
		echo Done
		return
	fi
	echo ERROR: Something went wrong!
	exit 1
}

install_plugins () {
	echo Installing plugins....
	nvim +PlugInstall +qall
	echo Done!
}

print_logo () {
	printf "\e[1;35m _   _                         _\n"
	printf "| \\ | |_   _  __ _  __ ___   _(_)_ __ ___\n"
	printf "|  \\| | | | |/ _\` |/ _\` \\ \\ / / | '_ \` _ \\ \n"
	printf "| |\\  | |_| | (_| | (_| |\\ V /| | | | | | |\n"
	printf "|_| \\_|\\__, |\\__,_|\\__,_| \\_/ |_|_| |_| |_|\n"
	printf "       |___/\e[0m\n"
	printf "Nyaavim by Clawbhaiya (https://github.com/clawbhaiya)\n"
}

print_logo
read -p "Continue installing Nyaavim? (This will backup your current Neovim config) [y/n]: " choice

if [ "$choice" == "n" ] ; then
	echo Install cancelled!
	exit 1
fi

create_backup
download_files
install_vim_plug
install_plugins

echo Nyaavim Installed! Open Neovim to see it in action!
