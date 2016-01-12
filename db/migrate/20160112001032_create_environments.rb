class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.references :user, index: true
      t.string :user_agent

      t.timestamps null: false
    end
    add_foreign_key :environments, :users
  end
end
