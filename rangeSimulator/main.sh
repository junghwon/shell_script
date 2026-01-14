#! /bin/bash

# 関数ライブラリを読み込み
. ./controller.sh
#. ./keyController.sh   # デバッグ用

mainProc() {
    while true; do
        controller_Manager
    done
}

keyScan() {
    while true; do
        keyController_ScanKey
        moji=$(keyController_GetKey "a")
        if [ "$moji" = "true" ]; then
            echo "aキーが押されました"
        fi
    done
}

keyController_Init
keyScan
mainProc &