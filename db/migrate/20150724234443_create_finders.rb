class CreateFinders < ActiveRecord::Migration
  def change
    create_table :finders do |t|
      t.string :question
      t.boolean :noneEnabled
      t.boolean :multipleChoice
      t.boolean :timed

      t.timestamps null: false
    end
  end
end
