# シェルスクリプトの基本

シェルスクリプトは、Unix/Linuxシステムのシェル（例: Bash）で実行されるスクリプト言語です。コマンドライン操作を自動化し、ファイル操作やシステム管理に使われます。以下に基本をまとめます。

## 1. スクリプトの作成と実行
- **ファイル拡張子**: `.sh`（例: `script.sh`）
- **Shebang**: スクリプトの先頭に `#!/bin/bash` を記述して、実行シェルを指定。
- **実行権限**: `chmod +x script.sh` で実行権限を付与。
- **実行方法**: `./script.sh` または `bash script.sh`。

## 2. 変数
- 宣言: `variable_name=value`（スペースなし）。
- 使用: `$variable_name` または `${variable_name}`。
- 例:
  ```bash
  name="Alice"
  echo "Hello, $name"
  ```

## 3. 引数とパラメータ
- スクリプト実行時の引数: `$1`, `$2`, ...（`$0` はスクリプト名）。
- 例:
  ```bash
  echo "First argument: $1"
  ```

## 4. 条件分岐
- `if` 文: 条件が真の場合に実行。
- 構文:
  ```bash
  if [ condition ]; then
      # 処理
  elif [ condition ]; then
      # 処理
  else
      # 処理
  fi
  ```
- 条件例: `[ $a -eq $b ]`（等しい）、`[ -f file ]`（ファイル存在）。

## 5. ループ
- **for ループ**: リストを繰り返し。
  ```bash
  for item in list; do
      echo $item
  done
  ```
- **while ループ**: 条件が真の間繰り返し。
  ```bash
  while [ condition ]; do
      # 処理
  done
  ```

## 6. 関数
- 定義: `function_name() { 処理 }`
- 呼び出し: `function_name`
- 例:
  ```bash
  greet() {
      echo "Hello"
  }
  greet
  ```

## 7. ファイル操作とコマンド実行
- ファイル操作: `touch file.txt`（作成）、`rm file.txt`（削除）、`cp src dst`（コピー）。
- コマンド実行: バッククォート `` `command` `` または `$()` で結果を取得。
  ```bash
  result=$(ls)
  echo $result
  ```

## 8. 数値計算
シェルスクリプトでは、基本的な算術演算が可能です。整数演算が主で、浮動小数点は `bc` コマンドを使用。

- **基本演算**: `$(( ))` 構文を使用。
  - 加算: `result=$((a + b))`
  - 減算: `result=$((a - b))`
  - 乗算: `result=$((a * b))`
  - 除算: `result=$((a / b))`（整数除算）
  - 剰余: `result=$((a % b))`
  - 例:
    ```bash
    a=10
    b=3
    sum=$((a + b))
    echo "Sum: $sum"  # 13
    ```

- **expr コマンド**: 古い方法で算術演算。
  - 例: `result=$(expr $a + $b)`
  - 注意: スペースが必要（`expr 10 + 3`）。

- **let コマンド**: 変数への代入と演算。
  - 例: `let "result = a + b"`

- **浮動小数点演算**: `bc` コマンドを使用（scaleで精度指定）。
  - 例:
    ```bash
    result=$(echo "scale=2; 10.5 / 3" | bc)
    echo "Result: $result"  # 3.50
    ```

- **比較演算**: 数値比較に使用。
  - `-eq`（等しい）、`-ne`（等しくない）、`-lt`（小さい）、`-le`（以下）、`-gt`（大きい）、`-ge`（以上）。
  - 例: `if [ $a -gt $b ]; then echo "a is greater"; fi`

## 9. デバッグとベストプラクティス
- デバッグ: `bash -x script.sh` で実行トレース。
- エラーハンドリング: `set -e` でエラー時に停止。
- コメント: `#` で始まる行。

これで基本的なシェルスクリプトの構造と数値計算が理解できます。詳細はBashマニュアルを参照してください。