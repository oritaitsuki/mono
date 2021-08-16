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
|value             |integer   |null: false                  |
|user              |references|null: false,foreign_key: true|