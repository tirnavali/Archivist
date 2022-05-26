class User < ApplicationRecord
  audited
  after_create :assign_default_role
  after_create :set_superadmin

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable

  has_many :vacations, dependent: :destroy
  enum role: [:user, :admin, :editor, :writer]
  has_many :audits
  has_many :record_submissions
  has_many :record_metadata, :through => :record_submissions
  
  # scope :update_actions, -> { joins(:audits).where('audits.action is = ?', 'update') }
  # scope :find_user, -> (id) { where('id = ?', id)}
  #@user.audits.where("action is ?", "update")
  
  def to_s
    self.email
  end

  def set_superadmin
    # initialize superadmin
    if User.all.size == 1
      self.superadmin = true
      self.save
    end
  end

  def assign_default_role
    self.user!
  end

  def fullname
    self.email
  end
end
