#!/bin/bash

# FIFOの初期化
KEYFIFO="/tmp/keyController_fifo"
rm -f "$KEYFIFO"
mkfifo "$KEYFIFO"

echo "=== FIFOテスト開始 ==="
echo "別ターミナルで以下を実行してください:"
echo "  echo 't' > $KEYFIFO"
echo ""

# タイムアウト付きで読み込み
echo "FIFOから読み込み待機中..."
result=$(timeout 5 cat < "$KEYFIFO" 2>/dev/null)
echo "読み込み結果: '$result'"

if [ "$result" = "t" ]; then
    echo "✓ FIFO読み込み成功"
else
    echo "✗ FIFO読み込み失敗"
fi

rm -f "$KEYFIFO"
