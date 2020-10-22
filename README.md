# テーブル設計

## usersテーブル

| Column              | Type    | Option      |
| ------------------- | ------- | ----------- |
| email               | string  | null: false |
| password            | string  | null: false |
| nickname            | string  | null: false |

### Association

- has_many :tweets
- has_many :comments
- has_many :messages
- has_one :profile

## tweetsテーブル

| Column        | Type       | Option                         |
| --------------| ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :order

## commentsテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :tweet

## profileテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| introduction  | text       |                                |
| area_id       | integer    |                                |
| hobby         | text       |                                |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to :user

## messagesテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

belongs_to :user