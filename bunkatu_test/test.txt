#!/bin/sh

# 関数ライブラリを読み込み
. ./functions.sh  # または source ./functions.sh

# メイン処理
if [ $# -eq 0 ]; then
    echo "no arguments"
    exit 1
fi

if [ "$1" = "h" ]; then
    greet "hello"
elif [ "$1" = "b" ]; then
    greet "bye"
else
    echo "unknown input"
fi

countdown 3

exit 0