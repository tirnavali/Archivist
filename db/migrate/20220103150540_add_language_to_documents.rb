class AddLanguageToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :language, null: true, foreign_key: true
  end
end
