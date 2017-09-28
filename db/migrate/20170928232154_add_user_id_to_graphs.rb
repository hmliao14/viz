class AddUserIdToGraphs < ActiveRecord::Migration[5.1]
  def change
    add_column :graphs, :user_id, :integer
  end
end
