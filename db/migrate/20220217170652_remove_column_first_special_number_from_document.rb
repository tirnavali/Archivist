class RemoveColumnFirstSpecialNumberFromDocument < ActiveRecord::Migration[7.0]
  def change
    remove_column :documents, :first_special_number
    remove_column :documents, :second_special_number
  end
end
