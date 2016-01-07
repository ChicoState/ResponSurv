class RemoveTimestampFromSelections < ActiveRecord::Migration
  def change
    remove_column :selections, :timestamp, :datetime
  end
end
