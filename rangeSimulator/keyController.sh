#! /bin/bash

declare -A keyController_Field

keyController_Init() {
    keyController_Field[keyCodeBuff]=" "
    keyController_Field[keyCode]=" "
    keyController_Field[isNewKey]="false"
}

keyController_ScanKey() {
    read keyInputBuff
    keyController_Field[keyCodeBuff]="$keyInputBuff"

    if [ "${keyController_Field[keyCodeBuff]}" != "\n" ]; then
        keyController_Field[isNewKey]="true"
        keyController_Field[keyCode]="${keyController_Field[keyCodeBuff]}"
        # echo ${keyController_Field[keyCode]}  # デバッグ用
    fi
}

keyController_GetKey() {
    #echo "keyController_GetKey" # デバッグ用

    rsp="false"

    if [ "${keyController_Field[isNewKey]}" = "true" ]; then
        if [ "${keyController_Field[keyCode]}" = "$1" ]; then
            keyController_Field[keyCode]=" "
            keyController_Field[isNewKey]="false"
            rsp="true"
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
