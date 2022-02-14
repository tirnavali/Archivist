class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :trackable
  enum role: [:user, :superadmin, :admin, :manager, :chief, :moderator]
  has_many :vacations
  

  def name_with_initial
    self.role
  end

  def full_name
    if self.name.nil? && self.surname.nil?
      self.email
    else
    "#{self.name} #{self.surname}"
    end
  end

  alias fullname full_name
end
