# FurimaアプリのDB設計

## user テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| family_name        | string  | null: false               |
| last_name          | string  | null: false               |
| family_name_(kana) | string  | null: false               |
| last_name_(kana)   | string  | null: false               |
| year_of_birth      | numeric | null: false               |
| month_of_birth     | numeric | null: false               |
| date_of_birth      | string  | null: false               |

### Association
・has_many : items
・has_many : comments
・has_many : purchase_records


## item テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| info             | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| area_of_origin   | string     | null: false                    |
| shipping＿time    | numeric    | null: false                    |
| price            | numeric    | null: false                    |
| users_id         | references | null: false, foreign_key: true |
| comments_id      | references | null: false, foreign_key: true |

### Association
・belongs_to : user
・has_many : comments
・has_one : purchase_records


## purchase_recordテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| users_id         | references | null: false, foreign_key: true |
| items_id         | references | null: false, foreign_key: true |

### Association
・has_one : delivery_address
・belongs_to : item
・belongs_to : user


## delivery＿addressテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal＿code        | numeric    | null: false                    |
| prefectures         | string     | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | numeric    | null: false                    |
| users_id            | references | null: false, foreign_key: true |
| purchase_records_id | references | null: false, foreign_key: true |

### Association
・belongs_to : purchase_record


## commentテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| users_id | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |

### Association
・belongs_to : user
・belongs_to : item