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
    keyController_GetKey "t"

    if [ "$keyController_GetKeyRsp" = "true" ]; then
        echo "debug_controller_TimerSetting_GetKey_success"    # デバッグ用
        if [ "${controller_Field[timer]}" -lt $CONST_TIMER_MAX ]; then
            controller_Field[timer]=$((controller_Field[timer] + 10))
        else
            controller_Field[timer]=0
        fi
        echo "${controller_Field[timer]}"
    fi
}

controller_WattSetting () {
    keyController_GetKey "w"

    if [ "$keyController_GetKeyRsp" = "true" ]; then
        echo "debug_controller_WattSetting_GetKey_success"    # デバッグ用
        if [ "${controller_Field[watt]}" -lt $CONST_WATT_500 ]; then
            controller_Field[watt]=$((controller_Field[watt] + 1))
        else
            controller_Field[watt]=$CONST_WATT_100
        fi
        echo "${controller_Field[watt]}"
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
