class AddDocumentTypeToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :document_type, null: true, foreign_key: true
  end
end
