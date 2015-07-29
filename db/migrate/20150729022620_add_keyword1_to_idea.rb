class AddKeyword1ToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :keyword1, :string
  end
end
