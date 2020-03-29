# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|e-mail|string|null: false, unique: true|
|password|string|null: false, unique: true|
|name|string|null: false|
|furigana|string|null: false|
|birthdate|integer|null: false|
|introduction|string|null: false|
|image|text|
### Association
- has_many :reviews
- has_many :images
- has_many :items
- has_many :comments
- has_many :likes
- has_many :points
- has_many :profits
- has_one :credit_card
- has_one :address

# addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|name_furigana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|building_name|string|
|room_number|integer|
|phone_number|integer|unique: true|
### Association		
- belongs_to :user	

# cardsテーブル		
|Column|Type|Options|
|------|----|-------|	
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false, foreign_key: true|
|card_id|string|null: false foreign_key: true|
### Association	
- belongs_to :user

# item_imagesテーブル		
|Column|Type|Options|
|------|----|-------|	
|image|text|null: false
|item_id|integer	null: false, foreign_key: true|
### Association		
- belongs_to :item			

# categorysテーブル		
|Column|Type|Options|
|------|----|-------|	
|ancestry|string|index true|
|name|string|null: false,add_index: true|
### Association		
- has_many :items		

# itemsテーブル		
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|name|string|null: false,add_index: true|
|description|text|null: false|
|category_id|string|null: false,add_index: true|
|brand|string|	
|status|string|null: false|
|size|null: false|
|price|integer|null: false|
|buyer_id|integer|foreign_key: true|
|postage|string|null: false|
|prefecture|string|null: false|
|day|integer|
### Association		
- has_many :comments		
- has_many :likes		
- has_many :images		
- has_many :reviews
- belongs_to :category	
- belongs_to :user	
