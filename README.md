# テーブル設計
## usersテーブル

| Column              | Type    | Options                 |
| ------------------- | ------- | ----------------------- |
| email               | string  | null:false,unique:true  |
| encrypted_password  | string  | null:false              |
| nickname            | string  | null:false              |
| last_name           | string  | null:false              |
| first_name          | string  | null:false              |
| last_name_kana      | string  | null:false              |
| first_name_kana     | string  | null:false              |
| birthday            | date    | null:false              |


### Association
- has_many :item
- has_many :order


## itemsテーブル
| Column              | Type          | Options                      |
| ------------------- | ------------- | ---------------------------- |
| name                | string        | null:false                   |
| description         | text          | null:false                   |
| category_id         | integer       | null:false                   |
| condition_id        | integer       | null:false                   |
| postage_id          | integer       | null:false                   |
| region_id           | integer       | null:false                   |
| shipping_date_id    | integer       | null:false                   |
| price               | integer       | null:false                   |
| user                | references    | null:false,foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル
| Column              | Type          | Options                       |
| ------------------- | ------------- | ------------------------------|
| user                | references    | null:false, foreign_key: true |
| item                | references    | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


### addressesテーブル
| Column              | Type          | Options                      |
| ------------------- | ------------- | -----------------------------|
| postal_code         | string        | null:false                   |
| region_id           | integer       | null:false                   |
| municipality        | string        | null:false                   |
| address             | string        | null:false                   |
| building_name       | string        |                              |
| phone_number        | string        | null:false                   |
| order               | references    | null:false, foreign_key:true |

### Association
- belongs_to :
