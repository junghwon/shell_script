# シェルスクリプトのファイル分割方法

シェルスクリプトをファイル分割してモジュール化することで、コードの再利用性と保守性を高めることができます。以下に基本的な方法を説明します。

## 基本的な分割手法

### 1. ライブラリファイルの作成
共通の関数や変数を別のシェルスクリプトファイル（例: `functions.sh`）に定義します。

```bash
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
```

### 2. メインスクリプトでの読み込み
メインスクリプト（例: `test.sh`）でライブラリファイルを読み込みます。

```bash
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
```

## 読み込みコマンドの違い

- **`.` (ドット)**: POSIX標準。シェル組み込みコマンド。
- **`source`**: Bash拡張。主にBashで使用。

どちらも同じ効果ですが、移植性を考慮して `.` を推奨します。

## 利点

- **再利用性**: 関数を複数のスクリプトで共有可能。
- **保守性**: コードを分割して管理しやすく、バグ修正が容易。
- **可読性**: メイン処理と補助関数を分離。

## 注意点

- **読み込み順**: 関数を使用する前にライブラリを読み込む。
- **パス指定**: 相対パスまたは絶対パスで正確に指定。
- **循環読み込み**: ファイルAがBを、BがAを読み込むような依存関係を避ける。
- **変数共有**: 読み込んだファイルの変数は共有される。必要に応じて `local` や `export` を使用。

## 実行例

```bash
$ ./test.sh h
hello
timer: 3
timer: 2
timer: 1
カウントダウン終了

$ ./test.sh b
bye
timer: 3
timer: 2
timer: 1
カウントダウン終了
```

この方法で、大規模なシェルスクリプトプロジェクトも整理できます。