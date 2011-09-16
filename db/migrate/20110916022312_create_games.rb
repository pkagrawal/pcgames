class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.integer :genre_id

      t.timestamps
    end
  end
end
