#! /bin/sh

f_func () {
    if [ $1 = "y" ];
    then
        return 0
    else
        return 1
    fi
}

f_func y && echo "success y"
f_func y || echo "fail y"

f_func n && echo "success n"
f_func n || echo "fail n"