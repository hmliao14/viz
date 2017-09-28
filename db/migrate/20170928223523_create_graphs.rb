class CreateGraphs < ActiveRecord::Migration[5.1]
  def change
    create_table :graphs do |t|
      t.string :title
      t.string :x_axis
      t.string :y_axis

      t.timestamps
    end
  end
end
