class Product < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

  # validates if a user has authorisation to make changes
  def can_change?(user)
    self.user == user || user.has_role?(:admin)
  end
=======
  has_one_attached :image
>>>>>>> f797ef645916ee1eefa39a10b5b28c628e214102
end
