class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :tile
      t.text :description

      t.timestamps null: false
    end
  end
end
