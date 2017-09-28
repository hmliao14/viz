class User < ApplicationRecord
  # Handles the URLS
  include FriendlyId
  friendly_id :first_name_and_last_name, use: [:finders, :slugged]

  def first_name_and_last_name
  "#{first_name}-#{last_name}"
  end
  
end
