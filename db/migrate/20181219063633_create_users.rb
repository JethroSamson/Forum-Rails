class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tbusers do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
