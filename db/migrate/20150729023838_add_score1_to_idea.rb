class AddScore1ToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :score1, :float
  end
end
