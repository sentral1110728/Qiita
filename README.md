## articles table

|Colum|Type|Options|
|-----|----|-------|
|title|string|null: false, index: true|
|text|text|null: false|
|image|string||
|user_id|references|null: false, foreign_key: true|

### Association
- has_many :comments
- belong_to :user

## comments table

|Colum|Type|Options|
|-----|----|-------|
|text|text|null: false|
|article_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :article

## users table

|Colum|Type|Options|
|-----|----|-------|
|nickname|string|null: false, uniqie: true|
|email|string|null: false, uniqie: true|
|password|string|null: false, uniqie: true|

### Association
- has_many :articles
- has_many :comments
