# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false, unique: true |
| email           | string | null: false               |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_date      | date   | null: false               |

### Association

- has_many :products
- has_one :address
- has_many :purchases

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture.id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| house_name    | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- belongs_to :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- has_one :address
- belongs_to :user

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | string     | null: false                    |
| price         | integer    | null: false                    |
| category_id   | integer    | null: false                    |
| product_id    | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| take_id       | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :take_time
