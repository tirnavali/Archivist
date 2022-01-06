class CreateSpecialNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :special_numbers do |t|
      t.integer :number
      t.references :special_number_name, null: false, foreign_key: true

      t.timestamps
    end
  end
end
