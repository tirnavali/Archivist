class AddSpecialNumberToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :special_number, null: true, foreign_key: true
  end
end
