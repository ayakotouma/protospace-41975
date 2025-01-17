# README

##　テーブル設計

###　usersテーブル
ユーザー情報を管理するテーブルです。

| カラム名           | 型         | オプション              | 説明            |
|-------------------|-----------|-----------------------|----------------|
| name          | string        | null: false               | ユーザー名                      ｜
| email             | string    | null: false, unique: true | ユーザーのメールアドレス（重複不可） |
| encrypted_password | string    | null: false              | 暗号化されたパスワード            |
| profile           | text     |                            | ユーザーのプロフィール             |
| occupation        | string   |                            | ユーザーの職業                    |
| position          | string   |                            | ユーザーの役職                   |

#### アソシエーション
- has_many :prototypes
- has_many :comments

### prototypes テーブル
投稿されたプロトタイプを管理するテーブルです。

| カラム名           | 型         | オプション              | 説明            |
|-------------------|-----------|-----------------------|----------------|
| title          | string     | null: false                    | プロトタイプのタイトル         ｜
| catch_copy     | text       | null: false                    | キャッチコピー                |
| concept        | text       | null: false                    | プロトタイプのコンセプト        |
| user           | references | null: false, foreign_key: true | 投稿者のIDを保存する外部キー     |

#### アソシエーション
- belongs_to :user
- has_many :comments

### comments テーブル
コメント情報を管理するテーブルです。

| カラム名     | 型       | オプション               | 説明                     |
|--------------|----------|--------------------------|--------------------------|
| content      | text     | null: false                     | コメント内容              |
| user         | references| null: false, foreign_key: true | コメント投稿者のID         |
| prototype    | references| null: false, foreign_key: true | コメント対象のプロトタイプID |

#### アソシエーション
- belongs_to :user
- belongs_to :prototype
