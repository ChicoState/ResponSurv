class AddingTimeColumnToMcQuestions < ActiveRecord::Migration
  def change
    add_column :mc_questions, :timer, :integer
  end
end
