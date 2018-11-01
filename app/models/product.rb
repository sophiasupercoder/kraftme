class Product < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :product_title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :medium, presence: true
  validates :quantity, presence: true
  validates :creator, presence: true
  # validates if a user has authorisation to make changes
  def can_change?(user)
    self.user == user || user.has_role?(:admin)
  end
  
end
