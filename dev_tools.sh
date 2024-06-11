#!/bin/bash

function python_commands {
    clear
    echo -e "\e[40mPython\e[0m"
    echo ""
    echo -e "\e[44m1. Install pip"
    echo -e "2. Install pipenv"
    echo -e "3. Install virtualenv"
    echo -e "4. Exit\e[0m"
    echo ""
    echo -n "Enter your choice: "
    read -n 1 choice

    case $choice in
        1) sudo apt install python3-pip ;;
        2) sudo apt install pipenv ;;
        3) sudo apt install virtualenv ;;
        4) return ;;
        *) echo "Invalid choice. Please try again." ;;
    esac

    echo ""
    echo -n "Press any key to go back to dev tools..."
    read -n 1
    echo
    python_commands
}


create_django_project() {
    echo -e "Enter the name of the project: "
    read -n 1 project_name
    django-admin startproject $project_name
}

create_django_app() {
    echo -e "Enter the name of the app: "
    read -n 1 app_name
    python3 manage.py startapp $app_name
}

run_django_server() {
    echo -e "Args: "
    read -n 1 args
    python3 manage.py runserver $args
}

make_migrations() {
    echo -e "Enter the name of the app: "
    read -n 1 app_name
    python3 manage.py makemigrations $app_name
}

migrate() {
    python3 manage.py migrate
}

create_superuser() {
    python3 manage.py createsuperuser
}

run_pytests() {
    echo -e "Show Pass Results too?(y/N): "
    read -n 1 show_pass_results
    
    if [ $show_pass_results == "y" ]; then
        pytest -rA
    else
        pytest
    fi
}

run_shell() {
    python3 manage.py shell
}

run_pytests_with_ai() {
    echo "args: "
    read args
    pytest $args 2>&1 | tee /home/sr/pytest_ai/pytest_ai_log.txt
    /usr/bin/python3 ~/pytest_ai/pytest_ai.py
    opera /home/sr/pytest_ai/pytest_log.md &
}


django_commands() {
    clear
    echo -e "1. Run Django server"
    echo -e "2. Run pytests"
    echo -e "3. Make Pytest with AI"
    echo -e "4. Make Migrations"
    echo -e "5. Migrate"
    echo -e "6. Create a Django project"
    echo -e "7. Create a Django app"
    echo -e "8. Create a superuser"
    echo -e "9. Run shell"
    echo -e "0. Exit"
    echo ""
    echo -e "Enter your choice: (default 1) "

    read -n 1 choice

    case $choice in
        1) run_django_server;;
        2) run_pytests;;
        3) run_pytests_with_ai;;
        4) make_migrations;;
        5) migrate;;
        6) create_django_project;;
        7) create_django_app;;
        8) create_superuser;;
        9) run_shell;;
        0) return;;
        *) run_django_server;;
    esac

    echo ""
    echo -n "Press any key to go back to dev tools..."
    read -n 1
    echo
    django_commands
}

get_pub() {
    echo "clean flutter? (y/N): "
    read -n 1 clean
    if [ $clean == "y" ]; then
        flutter clean
        if [ -d "domain" ]; then
            cd domain
            flutter pub get
            cd ..
        fi
        if [ -d "data" ]; then
            cd data
            flutter pub get
            cd ..
        fi
        if [ -d "presentation" ]; then
            cd presentation
            flutter pub get
            cd ..
        fi
        flutter pub get
    else
        if [ -d "domain" ]; then
            echo "which module?"
            echo "1. All"
            echo "2. Data"
            echo "3. Presentation"
            echo "4. Domain"
            echo ""
            echo "Enter your choice: (default 1):"
            read -n 1 choice
            if [ $choice == 1 ]; then
                cd domain
                flutter pub get
                cd ..
            elif [ $choice == 2 ]; then
                cd data
                flutter pub get
                cd ..
            elif [ $choice == 3 ]; then
                cd presentation
                flutter pub get
                cd ..
            elif [ $choice == 4 ]; then
                flutter pub get
            else
                cd domain
                flutter pub get
                cd ..

                cd data
                flutter pub get
                cd ..

                cd presentation
                flutter pub get
                cd ..
            fi
            flutter pub get
        fi

    fi
    echo "Directory exists."
    flutter pub get
}

create_flutter_project() {
    echo -e "Enter the name of the project: "
    read -n 1 project_name
    flutter create $project_name
}   

upgrade_flutter() {
    flutter upgrade
}

doctor_flutter() {
    flutter doctor
}

run_flutter_project() {
    flutter run
}

build_flutter_project() {
    flutter build apk
}



flutter_commands() {
    if command -v flutter &> /dev/null; then
        clear
    else
        export PATH="$PATH:$HOME/flutter/bin"
        clear
    fi

    echo -e "1. Get Pub"
    echo -e "3. Create a new Flutter project"
    echo -e "1. Upgrade Flutter"
    echo -e "2. Doctor Flutter"
    echo -e "4. Run Flutter project"
    echo -e "5. Build Flutter project"
    echo -e "6. Exit"
    echo ""
    echo -e "Enter your choice: (default 1) "
    echo ""
    read -n 1 choice
    echo ""


    case $choice in
        2) create_flutter_project;;
        3) upgrade_flutter;;
        4) doctor_flutter;;
        5) run_flutter_project;;
        6) build_flutter_project;;
        7) return;;
        *) get_pub;;
    esac

    echo ""
    echo -n "Press any key to go back to dev tools..."
    read -n 1
    echo
    flutter_commands
}


function dev_tools_main {
    clear
    echo -e "\e[40mDev Tools\e[0m"
    echo ""
    echo -e "\e[44m1. Python"
    echo -e "2. Django"
    echo -e "3. Flutter"
    echo -e "4. Exit\e[0m"
    echo ""
    echo -n "Enter your choice: "
    read -n 1 choice

    case $choice in
        1) python_commands ;;
        2) django_commands ;;
        3) flutter_commands ;;
        4) echo && exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac

    echo ""
    echo -n "Press any key to go back..."
    read -n 1
    echo
    dev_tools_main
}

dev_tools_main