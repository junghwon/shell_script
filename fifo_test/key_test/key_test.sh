#! /bin/bash

KEY_T="./key_fifo_t"
KEY_W="./key_fifo_w"

key_Init() {
    rm -f "$KEY_T" "$KEY_W"
    mkfifo "$KEY_T" "$KEY_W"
    echo "false" > "$KEY_T" &
    echo "false" > "$KEY_W" &
}

key_Scan() {
    read keyBuff < /dev/tty

    if [ "$1" = "$keyBuff" ]; then
        
    fi
}



# ---------------------------------------------------------
key_Scan() {
    read keyBuff < /dev/tty
    rsp="false"

    if [ "$keyBuff" = "$1" ]; then
        echo "true"
    fi
}

main_proc() {
    rsp=$(key_Scan "t");
    if [ "$rsp" = "true" ]; then
        echo "tが押された"
    fi

    rsp=$(key_Scan "w");
    if [ "$rsp" = "true" ]; then
        echo "wが押された"
    fi
}

while true; do
    main_proc
done
