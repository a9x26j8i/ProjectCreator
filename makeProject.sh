#!/usr/bin/env bash

unset TARGET_DIR
unset CURRENT_DIR

main(){
    export CURRENT_DIR=`pwd`
    export TARGET_DIR=$HOME/PycharmProjects/$1

    check_args $@
    create_project_dir_and_move $@
    git_init
    make_remote_repo

}

make_remote_repo() {
    python3 ${CURRENT_DIR}/make_remote_repo.py
}


git_init() {
    git init
    echo "#README" > README.md
    git add .
    git commit -m "Initial Commit"
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
    else
        echo "Making project directory $1"
    fi
}



#main $@
python3 make_remote_repo.py $1