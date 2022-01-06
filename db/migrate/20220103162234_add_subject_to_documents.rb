class AddSubjectToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :subject, null: true, foreign_key: true
  end
end
