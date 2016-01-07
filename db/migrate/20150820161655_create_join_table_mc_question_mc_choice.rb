class CreateJoinTableMcQuestionMcChoice < ActiveRecord::Migration
  def change
    create_join_table :mc_questions, :mc_choices do |t|
      t.index [:mc_question_id, :mc_choice_id]
      t.index [:mc_choice_id, :mc_question_id]
    end
  end
end
