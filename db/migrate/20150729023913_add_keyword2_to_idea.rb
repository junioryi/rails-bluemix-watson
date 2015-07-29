class AddKeyword2ToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :keyword2, :string
  end
end
