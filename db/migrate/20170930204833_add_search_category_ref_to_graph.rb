class AddSearchCategoryRefToGraph < ActiveRecord::Migration[5.1]
  def change
    add_reference :search_categories, :graph, index: true, foreign_key: true
  end
end
