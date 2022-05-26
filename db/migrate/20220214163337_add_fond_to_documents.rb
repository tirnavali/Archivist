class AddFondToDocuments < ActiveRecord::Migration[7.0]
  def change
    # add_reference :documents, :fond, null: false, foreign_key: true
  end
end
