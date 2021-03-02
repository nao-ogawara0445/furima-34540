## usersテーブル

|Column                 |Type   |Options    |
|nickname               |string |null: false|
|name_sei               |string |null: false|
|name_mei               |string |null: false|
|name_huri_sei          |string |null: false|
|name_huri_mei          |string |null: false|
|tanjyoubi              |date   |null: false|
|email                  |string |null: false|
|encrypted_password     |string |null: false|
### Association
- has_many: syouhins
## syouhinsテーブル

|Column            |Type       |Options    |
|syouhin_name      |string     |null: false|
|syouhin_setumei   |text       |null: false|
|kategori_id       |integer    |null: false|
|jyoutai_id        |integer    |null: false|

### Association
- belongs_to: user
- has_one: kounyuu   
- has_one: hassou   

## kounyuusテーブル

|Column            |Type       |Options            |
|souryou_id        |integer    |null: false        |
|hassou_moto_id    |integer    |null: false        |
|kakaku            |integer    |null: false        |
|nissuu_id         |integer    |null: false        |

### Association
- belongs_to:syouhin
- has_one:hassou



## hassousテーブル
|Column                 |Type       |Options    |
|yuubin_bangou          |string     |null: false|
|kounyuu_ken_id         |integer    |null: false|
|kounyuu_mati           | text      |null: false|
|kounyuu_banti          |text       |null: false|
|kounyuu_tate           |text       |           |
|tel                    |string     |null: false|

### Association
- belongs_to: syouhin
- belongs_to: kounyuu