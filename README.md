# README

## twitterapp

## tweetsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|text|text|null:false|
|image|string|null:false|

### Association
- belongs_to user
- has_many comments
- has_many favorites

## usersテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null:false|
|header_image|string||
|email|string|null:false|
|password|string|null:false|
|usericon|string||
|profile|text||

### Association
- has_many favorites
- has_many tweets
- has_many comments

## favoritesデーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|tweet_id|integer|null:false|

### Association
- belongs_to user
- belongs_to tweet

## commentsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|tweet_id|integer|null:false|
|text|text|null:false|

### Association
- belongs_to user
- belongs_to tweet