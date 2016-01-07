class CreateMcChoices < ActiveRecord::Migration
  def change
    create_table :mc_choices do |t|
      t.string :choice

      t.timestamps null: false
    end
  end
end
