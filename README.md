# テーブル設計

## users テーブル

| Colum                | Type    | Options                   |
| -------------------  | ------  | ------------------------  |
|email                 |string   |null: false, unique: true  |
|encrypted_password    |string   |null: false                |
|nickname              |string   |null: false                |
|first_name            |string   |null: false                |
|family_name           |string   |null: false                |
|read_first            |string   |null: false                |
|read_family           |string   |null: false                |
|birth                 |date     |null: false                |
|place_id              |integer  |null: false               |

### Association
has_many :items
has_many :user_items

## items テーブル

| Colum            | Type     | Options                     |
| ---------------  | -------  | --------------------------- |
|item_name         |string    |null: false                  |
|explanation       |text      |null: false                  |
|category_id       |integer   |null: false                  |
|place_id          |integer   |null: false                  |
|make_day_id       |integer   |null: false                  |
|city          |string    |null: false                  |
|address       |string    |null: false                  |
|value             |integer   |null: false                  |
|user              |references|null: false,foreign_key: true|

belongs_to :user
has_one :user_item
belongs_to_active_hash :category
belongs_to_active_hash :place
belongs_to_active_hash :make_day
belongs_to_active_hash :value

## user_items

| Colum   | Type     | Options                     |
| ------- | -------- | ----------------------------|
|item     |references|null: false,foreign_key: true|
|user     |references|null: false,foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addressテーブル

| Colum        | Type     | Options                     |
| ------------ | -------- | --------------------------- |
|post_number   |string    |null: false                  |
|place_id      |integer   |null: false                  |
|city          |string    |null: false                  |
|address       |string    |null: false                  |
|building_name |string    |                             |
|phone_number  |string    |null: false                  |
|user_item     |references|null: false,foreign_key: true|


### Association
belongs_to user_item




# アプリケーション名
mono

# アプリケーション概要
近くのユーザー同士が食材を共有できるようにする。

# URL
 https://mono36225.herokuapp.com/

ログイン情報(テスト)

・Eメール :oriori.100987@gmail.com
・パスワード :ori1009

# 制作背景(意図)
食料廃棄率の高い現状で少しでも地域で共有して減らしたいと考えたため。

# 利用方法
余った食材をユーザー同士で取引ができる。一覧表示から選べる

# 目指した課題解決
食材を無駄なく欲しい人のところに届けたい

# 洗い出した要件

	ユーザー管理機能	ユーザーを管理するため	devise を用いて登録できるようにする
	商品一覧表示機能	商品情報を表示するため	商品の画像を一覧できるようにする
	ユーザー情報登録機能	ユーザーの情報を登録するため	ユーザーの情報を登録する
  地域登録機能	距離の近いユーザーを探すため	距離の近いひとを探せるようにする
	クレージット支払い機能	クレージットでの支払いをできるようにするため	pay.jpを用いてクレージット支払い機能をつける

# 実装した機能についての画像やGIFおよびその説明
商品一覧機能
<a href="https://gyazo.com/b81c762bd3664ca49bed823541ebfc78"><img src="https://i.gyazo.com/b81c762bd3664ca49bed823541ebfc78.gif" alt="Image from Gyazo" width="1000"/></a>

ユーザー新規登録画面
[![Image from Gyazo](https://i.gyazo.com/9bd607c618e5eb167d3a95c642de3734.gif)](https://gyazo.com/9bd607c618e5eb167d3a95c642de3734)

ログイン画面
[![Image from Gyazo](https://i.gyazo.com/9fa664f8012f5f03c648d0df5abe3ac7.gif)](https://gyazo.com/9fa664f8012f5f03c648d0df5abe3ac7)

編集、削除画面
[![Image from Gyazo](https://i.gyazo.com/10a5e3f805bed98c42b6f03617eb872b.gif)](https://gyazo.com/10a5e3f805bed98c42b6f03617eb872b)


# 実装予定の機能
近くのユーザー同士を紐づける機能


# 工夫したポイント
ログインする際に地域を登録してもらい地域に応じた投稿を閲覧できるようにしたこと

# 使用技術(開発環境)

バックエンド
ruby, Ruby on Rails

フロントエンド
HTML, css, JavaScript

データベース
MySQL, Sequel Pro


Webサーバー(本番環境)
heroku

ソース管理
GitHub, GitHubDesktop

テスト
RSpec

エディター
VSCode

# 課題や今後実装したい機能

課題点
投稿の地域はわかるが、場所が遠い可能性もあるので近くの駅で場所を特定できるようなものを作りたい

今後実装したい機能
近くの駅で場所を特定できるようなAPIを導入したい


# データベース設計
<a href="https://gyazo.com/3a14ea7be13900f49bb2d5930783886b"><img src="https://i.gyazo.com/3a14ea7be13900f49bb2d5930783886b.png" alt="Image from Gyazo" width="656"/></a>