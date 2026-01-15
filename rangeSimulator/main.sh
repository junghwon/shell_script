#! /bin/bash

# 関数ライブラリを読み込み
. ./controller.sh
#. ./keyController.sh   # デバッグ用

mainProc() {
    while true; do
        controller_Manager
        controller_TimerSetting
    done
}

keyScan() {
    while true; do
        keyController_ScanKey

        # ===== 単体テスト =====
#        moji=$(keyController_GetKey "a")
#        if [ "$moji" = "true" ]; then
#            echo "aキーが押されました"
#        fi
        # ===== 単体テスト =====

    done
}

controller_Init
keyController_Init  # デバッグ用
mainProc &
keyScan
