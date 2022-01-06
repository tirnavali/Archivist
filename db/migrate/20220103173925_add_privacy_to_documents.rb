class AddPrivacyToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :privacy, null: true, foreign_key: true
  end
end
