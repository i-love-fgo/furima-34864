## usersテーブル

| Column           | Type    | Options       |
| -----------------| ------- | ------------- |
| nickname         | string  | null: false   |
| email            | string  | null: false   |
| password         | string  | null: false   |
| last-name(kanji) | string  | null: false   |
| first-name(kanji)| string  | null: false   |
| last-name(kana)  | string  | null: false   |
| first-name(kana) | string  | null: false   |
| birthday         | string  | null: false   |

## Association

- has_many :items
- has_many :comments
- has_one :buyers

## itemsテーブル

| Column           | Type    | Options         |
| ---------------- | ------- | --------------- |
| item-image       | ActiveStorageにて実装      |
| item-name        | string  | null: false     |
| item-description | string  | null: false     |
| item-category    | ActiveHashにて実装         |
| item-status      | ActiveHashにて実装         |
| item-delivery    | ActiveHashにて実装         |
| shipping-area    | ActiveHashにて実装         |
| shipping-days    | ActiveHashにて実装         |
| selling-price    | string  | null: false     |

## Association

- belongs_to :user
- has_many :comments
- belongs_to :buyer

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

| Column            | Type       | Options          |
| ----------------- | ---------- | ---------------- |
| card-information  | string     | null: false      |
| expiration-date   | string     | null: false      |
| security-code     | string     | null: false      |
| user              | references | null: false      |

## Association

- has_one :user
- has_one :shipping_address
- has_many :items

## shipping_addressesテーブル

| Column             | Type       | Options          |
| ------------------ | ---------- | ---------------- |
| postal-code        | string     | null: false      |
| prefectures        | ActiveHashにて実装             |
| municipality       | string     | null: false      |
| address            | string     | null: false      |
| building-name      | string     | optional: input  |
| phone-number       | string     | null: false      |

## Association

- has_one :buyer