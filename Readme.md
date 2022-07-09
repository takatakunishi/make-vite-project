# What is this project

このレポジトリは react(with vite)プロジェクトを作成、および起動するためのテンプレートです。

make コマンド, node, docker が使えることが前提となっています。

## 使用フロー

1. `make setup PROJECTNAME=app_name` (app_name は任意の値)<br/>
   react project と docker image を生成する
   `setup`とした場合はReactで、`setup-vue`とした場合はVueでプロジェクトを作成する。
2. `make up` => localhost3000 で動いている<br/>
   docker を起動する
3. `make shell`<br/>
   shell を起動する
4. 3.で出力された値を実行してシェルに入る。<br/>
   - `npm run dev`でアプリ(react)を起動
   - `npm run build`でビルド
   - `npm run preview`でビルド結果を起動
5. `make down`<br/>
   コンテナ群を落とす

## 起動確認

確認済みのversion

- node version => 16(16.15.0)<br/>
- npm => 8(8.5.5)

docker に権限を与えるために root ユーザーで make up してください(wsl 使用時)
