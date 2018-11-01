class Product < ApplicationRecord
  belongs_to :user

  # validates if a user has authorisation to make changes
  def can_change?(user)
    self.user == user || user.has_role?(:admin)
  end
  has_one_attached :image
end
