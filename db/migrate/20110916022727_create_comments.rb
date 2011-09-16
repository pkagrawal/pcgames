class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :game_id
      t.string :user_name
      t.string :comment_string

      t.timestamps
    end
  end
end
