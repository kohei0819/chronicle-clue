# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby version
```
2.6.4p104
```

## 初期操作
```
$ bin/bundle
$ yarn
$ bin/rails db:create

$ yarn add materialize-css
```

## プラグインのインストール方法（ファイルが作られていない時のみ）
```
$ bin/rails g rspec:install
$ bin/rails g devise:install
$ bin/rails g devise:views
$ bin/rails g devise user
$ bin/rails g active_admin:install
```

## DBのテーブル作成
```
$ bin/rails db:migrate
$ bin/rails db:seed
```

## DBのテーブル再作成
```
$ bin/rails db:migrate:reset
```

## seed指定実行
```
$ bin/rails r db/seeds/対象ファイル
```

## railsサーバーの起動
```
$ bin/rails s -b 0.0.0.0
```

## dbサーバーへの接続
$ psql -U postgres -h db

## active_adminへの対象追加
$ rails generate active_admin:resource 対象