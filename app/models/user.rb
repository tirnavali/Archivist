class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :vacations, dependent: :destroy
  enum role: [:user, :superadmin, :admin, :manager, :chief, :moderator]

  def to_s
    self.email
  end

  def fullname
    self.email
  end
end
