#! /bin/bash

# 関数ライブラリを読み込み
. ./controller.sh
#. ./keyController.sh   # デバッグ用

mainProc() {
    while true; do
        controller_TimerSetting
        controller_WattSetting
        controller_Manager
		sleep 0.5
    done
}

keyScan() {
    while true; do
        keyController_ScanKey
    done
}

# 初期化
controller_Init
#keyController_Init  # デバッグ用

echo "debug_main2"

# 並列実行
keyScan &
SCAN_PID=$!

echo "debug_main3"

mainProc &
MAIN_PID=$!

echo "debug_main4"

# スクリプト終了時にクリーンアップ
 trap "kill $MAIN_PID $SCAN_PID 2>/dev/null; rm -f /tmp/keyController_fifo /tmp/keyController_state_fifo" EXIT

 wait


