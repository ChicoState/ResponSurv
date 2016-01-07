class CreateJoinTableFinderItem < ActiveRecord::Migration
  def change
    create_join_table :finders, :items do |t|
       t.index [:finder_id, :item_id]
       t.index [:item_id, :finder_id]
    end
  end
end
