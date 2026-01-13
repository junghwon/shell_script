#!/bin/sh

# 共通関数ライブラリ

greet() {
    local message="$1"
    echo "$message"
}

countdown() {
    local timer="$1"
    while [ "$timer" -gt 0 ]; do
        echo "timer: $timer"
        timer=$((timer - 1))
        sleep 1
    done
    echo "カウントダウン終了"
}