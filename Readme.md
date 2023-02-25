# What is this project

このレポジトリは react(with vite)プロジェクトを作成、および起動するためのテンプレートです。

make コマンド, node, docker が使えることが前提となっています。

## 使用フロー

1. `Makefile`内の`PROJECTNAME=<<PROJECTNAME設定>>`の`<<PROJECTNAME設定>>`の部分を、このプログラムを一意に識別する名前に変更してください。
2. `make setup`<br/>
   react project と docker image を生成する
   `setup`とした場合はReactで、`setup-vue`とした場合はVueでプロジェクトを作成する。
3. VS Codeでdevcontainerを用いてdockerを起動しコンテナで編集を開始する<br/>
   makeコマンドとして次のものも用意しています
   - `make up`: コンテナの立ち上げ
   - `make down`: コンテナを修了する

## その他

- `rename-dir`: 親フォルダの名前をmake-vite-projectから変更する
- `rm-garbage`: Makefile, basicフォルダ, .gitなどの余分なファイルを削除
- `make setup-all`: `rename-dir`, `make rm-garbage`, `make setup`　をまとめて行う

## 起動確認

確認済みのversion

- node version => 16(16.15.0)
- npm => 8(8.5.5)

docker に権限を与えるために root ユーザーで make up してください(wsl 使用時)
