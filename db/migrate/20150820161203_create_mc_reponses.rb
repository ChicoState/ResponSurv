class CreateMcReponses < ActiveRecord::Migration
  def change
    create_table :mc_reponses do |t|
      t.belongs_to :mc_question, index:true
      t.belongs_to :mc_answer, index:true
      t.belongs_to :user, index:true

      t.timestamps null: false
    end
  end
end
