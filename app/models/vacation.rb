class Vacation < ApplicationRecord
  #belongs_to :user

  #scope :user_vacations, -> (user) {where('user_id == ?', user.id).order(:ending_date) }
end
