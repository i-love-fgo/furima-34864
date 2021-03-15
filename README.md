## usersテーブル

| Column              | Type    | Options                     |
| -----------------   | ------- | --------------------------- |
| nickname            | string  | null: false                 |
| email               | string  | null: false, unique: true   |
| encrypted_password  | string  | null: false                 |
| last_name           | string  | null: false                 |
| first_name          | string  | null: false                 |
| last_name_kana      | string  | null: false                 |
| first_name_kana     | string  | null: false                 |
| birthday            | date    | null: false                 |

## Association

- has_many :items
- has_many :comments
- has_many :buyers

## itemsテーブル

| Column           | Type      | Options                       |
| ---------------- | --------- | ----------------------------- |
| item_name        | string    | null: false                   |
| item_description | text      | null: false                   |
| category_id      | integer   | null: false                   |
| status_id        | integer   | null: false                   |
| delivery_id      | integer   | null: false                   |
| area_id          | integer   | null: false                   |
| duration_id      | integer   | null: false                   |
| selling_price    | integer   | null: false                   |
| user             | references| null: false, foreign_key: true|

## Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## commentsテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| text       | text       | null: false       |
| user       | references | null: false       |
| item       | references | null: false       |

## Association

- belongs_to :user
- belongs_to :item

## buyersテーブル

| Column            | Type       | Options                          |
| ----------------- | ---------- | -------------------------------- |
| user              | references | null: false, foreign_key: true   |
| item              | references | null: false, foreign_key: true   |

## Association

- belongs_to :user
- has_one :shipping_address
- belongs_to :item

## shipping_addressesテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ----------------                |
| postal_code        | string     | null: false                     |
| delivery_id        | integer    | null: false                     |
| municipality       | string     | null: false                     |
| address            | string     | null: false                     |
| building_name      | string     |                                 |
| phone_number       | string     | null: false                     |
| buyer              | references | null: false, foreign_key: true  |

## Association

- belongs_to :buyer