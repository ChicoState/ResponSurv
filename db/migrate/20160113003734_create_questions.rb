class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type, null:false
      t.integer :section_id, default: 1, null:false
      t.integer :sequence_id, default: 1, null:false
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :users
  end
end
