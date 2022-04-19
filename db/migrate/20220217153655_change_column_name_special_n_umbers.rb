class ChangeColumnNameSpecialNUmbers < ActiveRecord::Migration[7.0]
  def change
    rename_column :special_numbers, :name, :value
    
  end
end
