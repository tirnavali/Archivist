class CreateSpecialNumberNames < ActiveRecord::Migration[7.0]
  def change
    create_table :special_number_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
