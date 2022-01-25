class RemoveSpecialNubmerNameIdFromSpecialNumbers < ActiveRecord::Migration[7.0]
  def change
    remove_column :special_numbers, :special_number_name_id
  end
end
