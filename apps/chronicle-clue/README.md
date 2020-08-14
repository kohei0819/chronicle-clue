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
$ bin/rails db:migrate
$ bin/rails db:seed
```

## railsサーバーの起動
```
$ bin/rails s -b 0.0.0.0
```