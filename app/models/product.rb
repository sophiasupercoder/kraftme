class Product < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image
  
  
  # adds validation and sanitization to fields of product form when creating and updating a product
  validates :product_title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {minimum: 10}
  validates :price, presence: true, numericality: true
  validates :medium, presence: true, length: {maximum: 25}
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :creator, presence: true, length: {maximum: 50}

  ## image validation using the activestorage-validator gem
  # validates :image, presence: {message: 'required'}, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }

  validate :image_attached?

  # validates if a user has authorisation to make changes
  def can_change?(user)
    self.user == user || user.has_role?(:admin)
  end

  # converts price into cents for stripe
  def price_in_cents
       (price * 100).to_i
   end

  # custom image validation
  def image_attached?
    if !image.attached?
      errors.add(:image, 'required')
    elsif !image.blob.content_type.start_with?('image/', 'img/')
      errors.add(:image, 'image mustr be of type JPG or PNG')
    end
  end
   
end
