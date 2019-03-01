# Docker TypeScript Vue Starter

https://github.com/Microsoft/TypeScript-Vue-Starter

TypeScriptをVue.jsで学習できるチュートリアルをDockerで動かせるようにしたリポジトリです。
上記リポジトリのチュートリアルを参考にしています。
インストール直後でチュートリアルの最初の画面まで表示できます。
Dockerコンテナ内で`npm run watch`が実行中なので、ソースコードの変更が即時反映されます。

# インストールガイド

```
$ git clone git@github.com:kiyc/docker-typescript-vue-starter.git ts-vue-starter
$ cd ts-vue-starter
$ docker-compose build
$ docker-compose up -d
```
