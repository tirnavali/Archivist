class Audit < ApplicationRecord
  #This class is registred for use inverse_of relation with user
  #also adds extra functionality to model.
  time_range_today = Time.now.midnight..Time.now

  scope :create_actions, -> { where(action: "create")}
  scope :update_actions, -> { where(action: "update")}
  scope :user_activities, ->(user) { where("user_id = ?", user.id).order("created_at desc") }
  scope :today, ->{ where("created_at" => time_range_today) }
end
  