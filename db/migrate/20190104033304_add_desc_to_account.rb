class AddDescToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :desc, :text
  end
end
