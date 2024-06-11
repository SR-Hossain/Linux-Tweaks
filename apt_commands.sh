#!bin/bash

install_app(){
    clear
    echo -e "Apps Name: "
    read apps_names
    echo -e "-y? (Y/n)"
    read -n 1 choice
    echo 
    echo -e "Installing $apps_names..."
    echo 
    if [ $choice == "n" ]; then
        sudo apt install $apps_names
    else
        sudo apt install $apps_names -y
    fi
    echo 
    echo -n "Press any key to go back..."
    read -n 1
}


function apt_commands {
    clear
    echo -e "\e[42mAPT commands\e[0m"
    echo -e "\e[41m"
    echo -e "1. Upgrade Linux to the latest version without confirmation"
    echo -e "2. Upgrade Linux to the latest version"
    echo -e "3. Autoremove Linux"
    echo -e "4. Upgrade Linux with fix misssing"
    echo -e "5. Install an app"
    echo -e "6. Exit"
    echo ""
    echo -e "Enter your choice: (default 1)\e[0m"

    read -n 1 choice

    case $choice in
        2) sudo apt update && sudo apt upgrade;;
        3) sudo apt autoremove -y;;
        4) sudo apt update && sudo apt upgrade && sudo apt --fix-missing;;
        5) install_app;;
        6) return;;
        *) sudo apt update && sudo apt upgrade -y;;
    esac

    echo ""
    echo -n "Press any key to go back to main menu..."
    read -n 1
    echo
    apt_commands
}

apt_commands