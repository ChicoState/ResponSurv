class FixMcResposeColumn < ActiveRecord::Migration
  def change
    change_table :mc_reponses do |t|
      t.remove      :mc_answer_id
      t.belongs_to  :mc_choice, index:true
    end
    rename_table :mc_reponses, :mc_responces
  end
end
