class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :type
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :responses, :questions
  end
end
