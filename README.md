## usersテーブル

|Column                 |Type   |Options                  |
|nickname               |string |null: false              |
|family_name               |string |null: false              |
|first_name               |string |null: false              |            
|family_name_furi         |string |null: false              |
|first_name_furi          |string |null: false              |
|birthday       |date   |null: false              |
|email                  |string |null: false,unique: true |  
|encrypted_password     |string |null: false              |       
### Association
- has_many: items
- has_many: purchases
## itemテーブル

|Column            |Type       |Options    |
|item_name      |string     |null: false|
|item_exposition   |text       |null: false|
|category_id       |integer    |null: false|
|status_id        |integer    |null: false|
|postage_id        |integer    |null: false|
|shipping_id         |integer    |null: false|
|price            |integer    |null: false|
|days_id         |integer    |null: false|
### Association
- has_one: purchase
- belongs_to:user

## purchasesテーブル

|Column             |Type       |Options                      |
|user            |references   |null: false,foreign_key: true|
|item           |references    |null: false,foreign_key: true|
### Association
- belongs_to:item
- belongs_to:user
- has_one: sending


## sendingテーブル
|Column                 |Type       |Options    |
|postal_code          |string     |null: false|
|postage_id              |integer    |null: false|
|town          |string     |null: false|
|address          |string     |null: false|
|building           |string     |           |
|tel                    |string     |null: false|
|purchase             |references |null: false,foreign_key: true|
### Association
- belongs_to: purchase
