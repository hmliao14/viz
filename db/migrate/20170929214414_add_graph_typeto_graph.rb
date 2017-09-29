class AddGraphTypetoGraph < ActiveRecord::Migration[5.1]
  def change
    add_column :graphs, :graph_type, :string
  end
end
