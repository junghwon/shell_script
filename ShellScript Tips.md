# ShellScript Tips

## キーボードからの入力
https://eng-entrance.com/linux-shellscript-keyboard

## 並列処理
https://dev.classmethod.jp/articles/bash-multi-process/

## 関数の戻り値
https://qiita.com/ko1nksm/items/2c5543744cebd4fb1e61
https://saiseich.com/os/linux/linux_cmd_return/

## プロセス間通信
https://qiita.com/ko1nksm/items/897ba32ea07949d1d0e4

## 構造体
シェルスクリプト（特に Bash）には C 言語のような「構造体(struct)」はありませんが、連想配列（associative array）や配列の配列、キー付き文字列を使うことで構造体的なデータ構造を擬似的に実現できます。

以下に、Bash で構造体風データを扱う方法をいくつか示します。

1. 連想配列で構造体を表現
Bash

コードをコピー
#!/usr/bin/env bash

### Bash 4.0以降で利用可能
declare -A person

### フィールドを設定
person[name]="Alice"
person[age]=30
person[email]="alice@example.com"

### 出力
echo "Name: ${person[name]}"
echo "Age: ${person[age]}"
echo "Email: ${person[email]}"
ポイント

declare -A で連想配列を宣言。
${person[key]} でアクセス。
1つの連想配列が1つの構造体に相当。
<br>