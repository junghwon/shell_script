#! /bin/bash

# 定数定義を読み込み
. ./controllerDefine.sh
. ./keyController.sh

declare -A controller_Field=(
    [watt]=$CONST_WATT_500
    [timer]=0
)

controller_Manager() {
    abc=1   # デバッグ用
}