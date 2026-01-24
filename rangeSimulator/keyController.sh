#! /bin/bash

KEYFIFO="/tmp/keyController_fifo"
STATEFIFO="/tmp/keyController_state_fifo"


keyController_Init() {
	# FIFO init
	rm -f "$KEYFIFO" "$STATEFIFO"
	mkfifo "$KEYFIFO" 2> /dev/null
	mkfifo "$STATEFIFO" 2> /dev/null
	echo "false" > "$STATEFIFO" &

	echo "debug_keyController_1" # debug
}


keyController_ScanKey() {
    read keyInputBuff < /dev/tty

    if [ "$keyInputBuff" != "" ]; then
        echo "$keyInputBuff" > "$KEYFIFO" 2>/dev/null &
        echo "true" > "$STATEFIFO" 2>/dev/null &
    fi
}

keyController_GetKey() {
    rsp="false"
	targetKey="$1"

    if [ -p "$KEYFIFO" ]; then
		currentKey=$(timeout 0.5 cat < "$KEYFIFO" 2>/dev/null)

		if [ "$currentKey" = "$targetKey" ]; then
			rsp="true"
			echo "false" > "$STATEFIFO" 2>/dev/null &
		fi
	fi

    echo $rsp
}


# ===== 単体テスト =====
# keyController_Init

# while true; do
#     keyController_ScanKey
#    moji=$(keyController_GetKey "a")
#     if [ "$moji" = "true" ]; then
#         echo "aキーが押されました"
#     fi
# done
# ===== 単体テスト =====
