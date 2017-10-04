class Graph < ApplicationRecord
  belongs_to :user
  has_many :search_categories, dependent: :destroy
  validates :title, presence: true, length: {maximum: 200}


end
