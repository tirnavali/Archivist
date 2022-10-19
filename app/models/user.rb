class User < ApplicationRecord
  audited
  after_create :create_collection
  after_create :assign_default_role
  after_create :set_superadmin
  before_destroy :do_not_delete_superadmin, prepend: true

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable

  has_many :vacations, dependent: :destroy
  has_many :audits
  has_many :record_submissions, dependent: :nullify
  has_many :record_metadata, :through => :record_submissions
  has_many :collections
  
  enum role: [:user, :admin, :editor, :writer]
  
  # scope :update_actions, -> { joins(:audits).where('audits.action is = ?', 'update') }
  # scope :find_user, -> (id) { where('id = ?', id)}
  #@user.audits.where("action is ?", "update")
  paginates_per 15

  def to_s
    self.email
  end

  def create_collection
    Collection.create!(title: "Araştırma Listem", user: self)
  end

  def set_superadmin
    # initialize superadmin
    if User.all.size == 1
      self.superadmin = true
      self.save
    end
  end

  def do_not_delete_superadmin
    if self.superadmin?
      self.errors.add(:base, "You can not delete superadmins!")
      throw(:abort)
    end
  end

  def assign_default_role
    if self.role == nil
      self.user!
    end
  end

  def fullname
    self.email
  end
end
