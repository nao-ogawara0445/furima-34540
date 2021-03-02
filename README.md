## usersテーブル

|Column                 |Type   |Options                  |
|nickname               |string |null: false              |
|name_sei               |string |null: false              |
|name_mei               |string |null: false              |            
|name_huri_sei          |string |null: false              |
|name_huri_mei          |string |null: false              |
|tanjyoubi              |date   |null: false              |
|email                  |string |null: false,unique: true |  
|encrypted_password     |string |null: false              |       
### Association

- has_one: kounyuu,foreign_key: true
## syouhinsテーブル

|Column            |Type       |Options    |
|syouhin_name      |string     |null: false|
|syouhin_setumei   |text       |null: false|
|kategori_id       |integer    |null: false|
|jyoutai_id        |integer    |null: false|
|souryou_id        |integer    |null: false|
|hassou_moto_id    |integer    |null: false|
|kakaku            |integer    |null: false|
|nissuu_id         |integer    |null: false|
### Association
- has_one: kounyuu ,foreign_key: true 
  

## kounyuusテーブル

|Column             |Type       |Options                      |
|user_id            |integer    |null: false,foreign_key: true|
|syouhin_id         |integer    |null: false,foreign_key: true|
### Association
- belongs_to:syouhin
- belongs_to:user
- has_one: hassou


## hassousテーブル
|Column                 |Type       |Options    |
|yuubin_bangou          |string     |null: false|
|kounyuu_ken_id         |integer    |null: false|
|kounyuu_mati           |string     |null: false|
|kounyuu_banti          |string     |null: false|
|kounyuu_tate           |string     |           |
|tel                    |string     |null: false|

### Association
- belongs_to: kounyuu
