#!/bin/bash

config="$HOME/.config/nvim"
data="$HOME/.local/share/nvim"

config_bak="$HOME/.config/nvim_bak"
data_bak="$HOME/.local/share/nvim_bak"


info () {
	printf "\e[1;32m[INFO]\e[0m %s\n" "$1"
}

error () {
	printf "\e[1;31m[ERROR]\e[0m %s\n" "$1"
}

chk_last () {
	if [ $? != 0 ] ; then
		exit 1
	fi
}

create_backup () {
	if [ -d  "$config" ] ; then
		info "Backing up current Neovim configuration..."
		mv "$config" "$config_bak"
		rm -rf "$config"
		info "Configuration backed up to $config_bak"
		info "Done!"
	fi
	
	if [ -d  "$data" ] ; then
		info "Backing up current Neovim data..."
		mv "$data" "$data_bak"
		rm -rf "$data"
		info "Configuration backed up to $data_bak"
		info "Done!"
	fi
}

download_files () {
	if [ ! -f /bin/git ] ; then
		error "Please install git in order to install Nyaavim!"
	fi
	git clone https://github.com/clawbhaiya/nyaavim.git "$config"
	if [ $? != 0 ] ; then
		error "Something went wrong during cloning the repo!"
	fi
}

install_vim_plug () {
	echo Installing vim-plug...
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	if [ $? == 0 ] ; then
		info "Done!"
		return
	fi
	error "Something went wrong during cloning vim-plug!"
	exit 1
}

install_plugins () {
	info "Installing plugins...."
	nvim +PlugInstall +qall
	info "Done!"
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


restore_backup () {
	if [ ! -d "$config_bak" ] ; then
		error "Configuration Backup directory not found!"
		exit 1
	fi
	mv "$config_bak" "$config"
	chk_last
	if [ ! -d "data_bak" ] ; then
		error "Data Backup directory not found"
		exit 1
	fi
	mv "$data_bak" "$data"
	chk_last
	info "Previous config and data restored!"
}


print_logo

read -p "Install/Uninstall Nyaavim? [i/u]: " choice
if [ "$choice" == "i" ] ; then
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
elif [ "$choice" == "u" ] ; then
	restore_backup
fi

