class AddTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string, limit: 255
    add_index :users, :token, unique: true
  end
end
