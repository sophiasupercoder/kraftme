class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :products, dependent: :destroy

  has_and_belongs_to_many :roles, :join_table => :users_roles
  
  # sets default role of 'standard_user' upon creation of user class 
  after_create :set_default_role

  def set_default_role
    self.add_role(:standard_user) if self.roles.blank?
  end

end
