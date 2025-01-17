class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false # コメントのテキスト（必須項目）
      t.references :user, null: false, foreign_key: true # ユーザーを参照
      t.references :prototype, null: false, foreign_key: true # プロトタイプを参照

      t.timestamps
    end
  end
end
