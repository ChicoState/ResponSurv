class AddFinderIdToMcQuestions < ActiveRecord::Migration
  def change
    add_reference :mc_questions, :finder, index: true, foreign_key: true
  end
end
