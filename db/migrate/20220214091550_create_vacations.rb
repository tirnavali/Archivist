class CreateVacations < ActiveRecord::Migration[7.0]
  def change
    create_table :vacations do |t|
      t.string :explanation
      t.references :user, null: false, foreign_key: true
      t.datetime :starting_date
      t.datetime :ending_date

      t.timestamps
    end
  end
end
