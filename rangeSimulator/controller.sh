#! /bin/bash

# 定数定義を読み込み
. ./controllerDefine.sh
. ./keyController.sh

declare -A controller_Field

controller_Init() {
    controller_Field[watt]=$CONST_WATT_500
    controller_Field[timer]=0
    keyController_Init
}

controller_TimerSetting () {
#    echo "controller_TimerSetting"  # デバッグ用
	echo "debug4"

    moji=$(keyController_GetKey "t")
	echo "debug5"
    if [ "$moji" = "true" ]; then
        echo "$moji"    # デバッグ用
#        if [ "${controller_Field[timer]}" -lt $CONST_TIMER_MAX ]; then
#            controller_Field[timer]=$((controller_Field[timer] + 10))
#        else
#            controller_Field[timer]=0
#        fi
#        echo controller_Field[timer]    # デバッグ用
    fi
}

#controller_start() {
#    rsp=$(keyController_GetKey "s")
#    if [ "$rsp" = "true" ]; then
#        echo "start"    # デバッグ用
#    fi
#}

controller_Stop() {
    controller_Init

}

controller_Manager() {
    abc=1   # デバッグ用
}
