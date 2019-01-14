class AddImageToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :image, :string
  end
end
