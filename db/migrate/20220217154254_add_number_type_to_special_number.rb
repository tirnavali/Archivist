class AddNumberTypeToSpecialNumber < ActiveRecord::Migration[7.0]
  def change
    add_reference :special_numbers, :number_type, null: false, foreign_key: true
  end
end
