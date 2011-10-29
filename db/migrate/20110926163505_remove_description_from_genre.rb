class RemoveDescriptionFromGenre < ActiveRecord::Migration
  def up
    remove_column :genres, :description
  end

  def down
    add_column :genres, :description, :string
  end
end
