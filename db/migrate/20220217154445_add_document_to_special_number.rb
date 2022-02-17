class AddDocumentToSpecialNumber < ActiveRecord::Migration[7.0]
  def change
    add_reference :special_numbers, :document, null: false, foreign_key: true
  end
end
