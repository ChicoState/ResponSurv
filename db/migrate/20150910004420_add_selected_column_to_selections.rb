class AddSelectedColumnToSelections < ActiveRecord::Migration
  def change
    add_column :selections, :selected, :boolean
  end
end
