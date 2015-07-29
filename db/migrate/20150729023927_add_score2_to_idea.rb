class AddScore2ToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :score2, :float
  end
end
