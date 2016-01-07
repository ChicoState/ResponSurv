class ChangeColumnOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :order, :orderable
  end
end
