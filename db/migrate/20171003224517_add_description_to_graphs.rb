class AddDescriptionToGraphs < ActiveRecord::Migration[5.1]
  def change
    add_column :graphs, :description, :string
  end
end
