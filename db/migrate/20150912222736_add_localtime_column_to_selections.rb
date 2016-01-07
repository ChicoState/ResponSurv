class AddLocaltimeColumnToSelections < ActiveRecord::Migration
  def change
    add_column :selections, :local_time, :datetime
  end
end
