#!/bin/bash

function multiple_audio_device_outputs() {
    clear
    echo -e "\e[43m1. Combine audio outputs"
    echo -e "2. Stop combining audio outputs"
    echo -e "3. Exit"
    echo ""
    echo -e "Enter your choice: \e[0m"
    read -n 1 choice
    echo ""
    echo ""

    if [ $choice == 1 ]; then
        pactl load-module module-combine-sink sink_name=combined
    elif [ $choice == 2 ]; then
        pactl unload-module module-combine-sink
    elif [ $choice == 3 ]; then
        return
    fi

    echo -e "\e[32mDone!\e[0m"
    read -n 1 -s -r -p "Press any key to continue..."
    multiple_audio_device_outputs
}

function show_summary_information() {
    pactl list sinks
    echo ""
}

function main() {
    clear
    echo -e "\e[42mAudio tweaks"
    echo -e "1. Multiple audio device outputs (e.g. multiple earphones and speaker)"
    echo -e "2. Show information about the current audio configuration (e.g. bluetooth charge)"
    echo -e "3. Exit"
    echo ""
    echo -e "Enter your choice: "
    echo -e "\e[0m"
    read -n 1 choice
    echo ""
    if [ $choice == 1 ]; then
        multiple_audio_device_outputs
    elif [ $choice == 2 ]; then
        pactl list sinks
    elif [ $choice == 3 ]; then
        return
    fi
    echo ""
    echo ""
    read -n 1 -s -r -p "Press any key to continue..."
    main
}

main

clear