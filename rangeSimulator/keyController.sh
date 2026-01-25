#! /bin/bash

KEYFIFO="/tmp/keyController_fifo"
STATEFIFO="/tmp/keyController_state_fifo"

keyController_GetKeyRsp="ralse"

keyController_Init() {
	# FIFO init
	rm -f "$KEYFIFO" "$STATEFIFO"
	mkfifo "$KEYFIFO" 2> /dev/null
	mkfifo "$STATEFIFO" 2> /dev/null
	echo "false" > "$STATEFIFO" &

	echo "debug_keyController_Init" # debug
}


keyController_ScanKey() {
    read keyInputBuff < /dev/tty

    if [ "$keyInputBuff" != "" ]; then
		echo "debug_keyController_ScanKey"

        echo "$keyInputBuff" > "$KEYFIFO" 2>/dev/null &
        echo "true" > "$STATEFIFO" 2>/dev/null &
    fi
}

keyController_GetKey() {
	keyController_GetKeyRsp="false"
	targetKey="$1"

    if [ -p "$KEYFIFO" ]; then
		currentKey=$(timeout 0.5 cat < "$KEYFIFO" 2>/dev/null)

		if [ "$currentKey" = "$targetKey" ]; then
			keyController_GetKeyRsp="true"
			echo "false" > "$STATEFIFO" 2>/dev/null &
		fi
	fi
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
