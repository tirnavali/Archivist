class AddToponymToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :toponym, null: true, foreign_key: true
  end
end
