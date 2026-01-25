#! /bin/bash

# 関数ライブラリを読み込み
. ./controller.sh
#. ./keyController.sh   # デバッグ用

mainProc() {
    while true; do
        controller_Manager
		sleep 0.5
    done
}

timerSetting() {
    while true; do
        controller_TimerSetting
        sleep 0.01
    done
}

wattSetting() {
    while true; do
        controller_WattSetting
        sleep 0.01
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

# 初期化
controller_Init
#keyController_Init  # デバッグ用

echo "debug_main2"

# 並列実行
keyScan &
SCAN_PID=$!

timerSetting &
TIMER_PID=$!

wattSetting &
WATT_PID=$!

echo "debug_main3"

mainProc &
MAIN_PID=$!

echo "debug_main4"

# スクリプト終了時にクリーンアップ
 trap "kill $MAIN_PID $SCAN_PID $TIMER_PID $WATT_PID 2>/dev/null; rm -f /tmp/keyController_fifo /tmp/keyController_state_fifo" EXIT

 wait


