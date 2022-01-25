class AlterColumnNameOfSpecialNumbers < ActiveRecord::Migration[7.0]
  def change
    rename_column :special_numbers, :number, :name
  end
end
