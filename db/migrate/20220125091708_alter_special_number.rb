class AlterSpecialNumber < ActiveRecord::Migration[7.0]
  def change
    change_column :special_numbers, :number, :string    
  end
end
