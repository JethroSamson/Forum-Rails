class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :email
      t.string :title
      t.text :content
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
