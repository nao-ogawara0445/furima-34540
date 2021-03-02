## userテーブル

|Column       |Type   |Options    |
|nickname     |string |null: false|
|name_sei     |string |null: false|
|name_mei     |string |null: false|
|name_huri_sei|string |null: false|
|name_huri_mei|string |null: false|
|tanjyou_nen  |integer|null: false|
|tanjyou_tuki |integer|null: false|
|tanjyou_niti |integer|null: false|
|email        |string |null: false|
|password     |string |null: false|

## syouhinテーブル

|Column         |Type       |Options    |
|image          |           |           |
|syouhin_name   |string     |null: false|
|syouhin_setumei|text       |null: false|
|kategori       |integer    |null: false|
|jyoutai        |integer    |null: false|
|user           |references |belong_to  |
|kounyuu        |references |has_one    |
|hassou         |references |has_one    |

## kounyuuテーブル

|Column         |Type       |Options            |
|souryou        |integer    |ActiveStorageで実装 |
|hassou_moto    |integer    |null: false        |
|kakaku         |integer    |null: false        |   
|nissuu         |integer    |null: false        |
|syouhin        |references |belong_to          |
|hassou         |references |has_one            | 



## hassouテーブル
|Column              |Type       |Options    |
|yuubin_bangou       |integer    |null: false|
|kounyuu_ken         |integer    |null: false|
|kounyuu_mati        | text      |null: false|
|kounyuu_banti       |text       |null: false|
|kounyuu_tate        |text       |           |
|tel                 |integer    |null: false|
|syouhin             |references |belong_to  |
| kounyuu            |references |belong_to  |