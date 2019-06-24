#!/usr/bin/env bash

unset TARGET_DIR
unset CURRENT_DIR
unset PROJECT_NAME

create(){
    if ! check_args $@
    then
        return 0
    fi

    export PROJECT_NAME=$1
    export CURRENT_DIR=`pwd`
    export TARGET_DIR=$HOME/PycharmProjects/$1

    create_project_dir_and_move $@
    git_init_create_add
    echo "Finish!!"

    make_remote_repo() {
        python3 ${CURRENT_DIR}/make_remote_repo.py ${PROJECT_NAME}
    }
    git_init_create_add() {
        git init
        echo "#README" > README.md
        make_remote_repo
        git remote add origin https://github.com/a9x26j8i/${PROJECT_NAME}.git
        git add .
        git commit -m "Initial Commit"
        git push -u origin master
    }
    create_project_dir_and_move() {
        if [[ -d ${TARGET_DIR} ]]
        then
            echo "[INFO]Target directory exists."
        else
            echo "[WARN]Target directory doesn\'t exists!"
            echo "[INFO]Making directory..."
            mkdir -p ${TARGET_DIR}
            echo "[INFO]Successfully made directory."
        fi

        cd ${TARGET_DIR}
    }
    check_args() {
        if [[ $# -eq 0 ]]
        then
            echo "No project name! Please provide project name as argument."
            return 1
        else
            echo "Making project directory $1"
            return 0
        fi
    }
}







