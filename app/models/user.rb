class User < ApplicationRecord
  rolify
  audited
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable

  has_many :vacations, dependent: :destroy
  enum role: [:user, :admin, :editor, :writer]
  has_many :audits
  
  # scope :update_actions, -> { joins(:audits).where('audits.action is = ?', 'update') }
  # scope :find_user, -> (id) { where('id = ?', id)}
  #@user.audits.where("action is ?", "update")
  
  def to_s
    self.email
  end

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def fullname
    self.email
  end
end
