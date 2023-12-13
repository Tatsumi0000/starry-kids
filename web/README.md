## web

このディレクトリ構成は月文字を変換するRailsの`backend`と、`backend`にリクエストを送受信するVueの`frontend`で構成しています。

## backend
Railsを開発するディレクトリです。

## frontend
Vueを開発するディレクトリです。

## 開発
Dockerを使って開発をします。

```
make setup
docker compose up
```

## 本番運用
本番環境の設定をします。デプロイ方法などはサーバによって適切な方法で試して下さい。

`web/backend/config/credentials.yml.enc`を一旦削除して次のコマンドを実行して下さい。
```sh
docker compose run --rm backend /bin/bash
EDITOR="vim" rails credentials:edit
```

コマンドを実行したら本番環境のパラメータを設定します。
```yml
starrykids:
  db_host: "DBのホスト名"
  db_name: "DBのデータベース名"
  db_username: "DBのユーザ名"
  db_password: "DBのパスワード"
  url: "Railsを動かすURL"
```

本番サーバの環境変数に生成した`master.key`をセットします。
|  環境変数名  |  設定内容  |
| ---- | ---- |
|  RAILS_MASTER_KEY  |  master.keyの中身  |

この`RAILS_MASTER_KEY`を元に`web/backend/config/credentials.yml.enc`をRailsが勝手に復号化します。
