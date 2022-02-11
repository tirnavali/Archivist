class CreateFonds < ActiveRecord::Migration[7.0]
  def change
    create_table :fonds do |t|
      t.string :name
      t.belongs_to :parent, null: true, foreign_key: {to_table: :fonds}

      t.timestamps
    end
  end
end
