class Graph < ApplicationRecord
  belongs_to :user
  has_many :search_categories, dependent: :destroy
end
