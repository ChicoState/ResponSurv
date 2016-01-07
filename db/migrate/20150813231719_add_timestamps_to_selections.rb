class AddTimestampsToSelections < ActiveRecord::Migration
  def change
    change_table :selections do |t|
      t.timestamps null: false
    end
  end
end
