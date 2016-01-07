class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.belongs_to  :item, index: true
      t.belongs_to  :finder, index:true
      t.datetime    :timestamp
      t.belongs_to  :user, index:true
      t.integer     :row
      t.integer     :column
    end
  end
end
