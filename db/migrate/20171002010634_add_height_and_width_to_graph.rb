class AddHeightAndWidthToGraph < ActiveRecord::Migration[5.1]
  def change
    add_column :graphs, :height, :integer
    add_column :graphs, :width, :integer
  end
end
