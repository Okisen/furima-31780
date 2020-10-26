# テーブル設計

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_ruby | string | null: false |
| last_name_ruby  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :trades

## items テーブル   
| Column           | Type       | Options                       |
| ---------------- | -----------| ----------------------------- |
| name             | string     | null: false                   |
| description      | text       | null: false                   |
| category         | string     | null: false                   |
| state            | string     | null: false                   |
| delivery_charges | string     | null: false                   |
| delivery_area    | string     | null: false                   |
| days             | string     | null: false                   |
| price            | integer    | null: false                   |
| user             | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :trade

## trades テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer_address
- has_one :credit_card

## buyer_addresses テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postal_code  | string     | null: false                   |
| prefecture   | string     | null: false                   |
| city         | string     | null: false                   |
| addresses    | string     | null: false                   |
| phone_number | integer    | null: false                   |
| trade        | references | null: false foreign_key: true |

### Association

- belongs_to :trade

## credit_cards テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_num       | integer    | null: false                    |
| cvc            | integer    | null: false                    |
| date_exp_month | integer    | null: false                    |
| date_exp_year  | integer    | null: false                    |
| trade          | references | null: false, foreign_key: true |

### Association

- belongs_to :trade
