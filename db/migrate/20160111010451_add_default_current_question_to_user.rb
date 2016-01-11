class AddDefaultCurrentQuestionToUser < ActiveRecord::Migration
  def up
    change_column :users, :current_question, :integer, default: 0
  end

  def down
    change_column :users, :current_question, :integer, default: nil
  end
end
