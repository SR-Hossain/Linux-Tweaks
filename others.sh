#!/bin/bash

function fix_opera_ffmpeg_error {
    folders=$(find /snap/chromium-ffmpeg/current/ -maxdepth 1 -type d -name 'chromium-ffmpeg-*' -printf "%T@ %p\n" | sort -n -r | cut -d' ' -f 2-)
    for folder in $folders
    do
        echo $folder
        sudo cp "$folder/chromium-ffmpeg/libffmpeg.so" /usr/lib/x86_64-linux-gnu/opera/
        echo ""
        echo ""
        echo "Close all your opera windows, and reopen to check if it worked or not."
        echo "If it did not work, then type n to solve using another method, else press anything else to exit."
        read -n 1 choice
        if [ $choice == "n" ]; then
            continue
        else
            break
        fi
    done
    latest_folder=$(find /snap/chromium-ffmpeg/current/ -maxdepth 1 -type d -name 'chromium-ffmpeg-*' | sort -V | tail -n 1)
    sudo cp "$latest_folder/chromium-ffmpeg/libffmpeg.so" /usr/lib/x86_64-linux-gnu/opera/
    echo "Done"
}

function others_main {
    clear
    echo -e "\e[40mOther Hacks\e[0m"
    echo ""
    echo -e "\e[44m1. Fix Opera FFMPEG Error"
    echo -e "2. Exit\e[0m"
    echo ""
    echo -n "Enter your choice: "
    read -n 1 choice

    case $choice in
        1) fix_opera_ffmpeg_error ;;
        2) echo && exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac

    echo ""
    echo -n "Press any key to go back..."
    read -n 1
    echo
    others_main
}

others_main