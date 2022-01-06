class CreateToponyms < ActiveRecord::Migration[7.0]
  def change
    create_table :toponyms do |t|
      t.string :name

      t.timestamps
    end
  end
end
