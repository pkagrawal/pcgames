class AddRatingVotesToGame < ActiveRecord::Migration
  def up
    add_column :games, :votes, :integer, {:default => 0}
    add_column :games, :rating, :float, {:default => 0.0}
  end

  def down
    remove_column :games, :votes
    remove_column :games, :rating
  end
end
