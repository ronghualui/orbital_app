class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :type
      t.string :title
      t.string :description
      t.datetime :deadline
      t.boolean :completed
      t.integer :creator_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

  add_index :quests, [:user_id, :created_at]
  add_index :quests, [:creator_id, :created_at]

  end
end
