# DB 設計

## users table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| email              | string              | null: false, unique: true     |
| encrypted_password | string              | null: false                   |
| nickname           | string              | null: false                   |
| last_name          | String              | null: false                   |
| first_name         | String              | null: false                   |
| last_name_kana     | String              | null: false                   |
| first_name_kana    | String              | null: false                   |
| birthday           | date                | null: false                   |

### Association

* has_many :items
* has_many :orders
* has_many :comments

## items table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| name               | string              | null: false                    |
| description        | text                | null: false                    |
| category_id        | integer             | null: false                    |
| status_id          | integer             | null: false                    |
| shipping_cost_id   | integer             | null: false                    |
| prefecture_id      | integer             | null: false                    |
| delivery_time_id   | integer             | null: false                    |
| price              | integer             | null: false                    |


### Association

- belongs_to :user
- has_many   :comments
- has_one    :order

## orders table

| Column              | Type               | Options                        |
|---------------------|--------------------|--------------------------------|
| user                | references         | null: false, foreign_key: true |
| item                | references         | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one:payment

## payments table

| Column               | Type              | Options                        |
|----------------------|-------------------|--------------------------------|
| order                | references        | null: false, foreign_key: true |
| postcode             | string            | null: false                    |
| prefecture_id        | integer           | null: false                    |
| city                 | string            | null: false                    |
| block                | string            | null: false                    |
| building             | string            |                                |
| phone_number         | string            | null: false                    |


### Association

- belongs_to :order

## comments table

| Column               | Type              | Options                        |
|----------------------|-------------------|--------------------------------|
| user                 | references        | null: false, foreign_key: true |
| item                 | references        | null: false, foreign_key: true |
| text                 | text              | null: false                    |

### Association

- belongs_to :user
- belongs_to :item