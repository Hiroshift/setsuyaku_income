# README

## テーブル設計

### Usersテーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| hourly_rate        | integer | null: false               |
| total_income       | integer | default: 0                |

#### Association
- has_many :recordings

---

### Recordingsテーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| amount         | integer    | null: false                    |
| recorded_date  | date       | null: false                    |
| user           | references | null: false, foreign_key: true |
| created_at     | datetime   | null: false                    |
| updated_at     | datetime   | null: false                    |

#### Association
- belongs_to :user