class AddCurrentQuestionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_question, :integer
  end
end
