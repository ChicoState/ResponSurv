class ChangePolymorphColumnOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.belongs_to :mc_question, index:true
      t.belongs_to :finder, index:true
    end
  end
end
