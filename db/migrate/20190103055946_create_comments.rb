class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :email
      t.text :laman
      t.integer :acctid
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
