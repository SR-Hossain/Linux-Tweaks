#!/bin/bash

function cool_tweaks_main {
    clear
    echo -e "\e[40mCool Tweaks\e[0m"
    echo ""
    echo -e "\e[44m1. Terminal Copilot (Gemini AI generates terminal commands)"
    echo -e "2. Image To Text Generation Tool Using Flameshot and Python\e[0m"
    echo -e "\e[44m3. Exit\e[0m"
    echo ""
    echo -n "Enter your choice: "
    read -n 1 choice
    echo

    case $choice in
        1) echo -e "\e[34mVisit https://github.com/SR-Hossain/Terminal-Copilot and follow the instructions in readme\e[0m" ;;
        2) echo -e "\e[34mVisit https://github.com/SR-Hossain/image2textSR and follow the instructions in readme\e[0m" ;;
        3) echo && return ;;
        *) echo "Invalid choice. Please try again." ;;
    esac

    echo ""
    echo -n "Press any key to go back..."
    read -n 1
    echo
    cool_tweaks_main
}

cool_tweaks_main