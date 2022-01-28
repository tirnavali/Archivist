class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable
  enum role: [:user, :superadmin, :admin, :manager, :chief, :moderator]


  def name_with_initial
    self.role
  end
end
