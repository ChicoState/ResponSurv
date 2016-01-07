class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order
      t.references :question, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
