class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :graphs, dependent: :destroy;

  # Handles the URLS
  include FriendlyId
  friendly_id :first_name_and_last_name, use: [:finders, :slugged]

  def first_name_and_last_name
  "#{first_name}-#{last_name}"
  end

end
