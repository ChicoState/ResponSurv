class FixMcResponceTable < ActiveRecord::Migration
  def change
    rename_table :mc_responces, :mc_responses
  end
end
