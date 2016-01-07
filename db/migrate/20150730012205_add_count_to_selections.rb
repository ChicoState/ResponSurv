class AddCountToSelections < ActiveRecord::Migration
  def change
    add_column :selections, :count, :integer
  end
end
