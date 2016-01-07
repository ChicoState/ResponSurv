class CreateMcQuestions < ActiveRecord::Migration
  def change
    create_table :mc_questions do |t|
      t.string :prompt
      t.belongs_to :item, index:true

      t.timestamps null: false
    end
  end
end
