class AddPeopleToDocuments < ActiveRecord::Migration[7.0]
  def change
    # add_reference :documents, :person, null: true, foreign_key: true
  end
end
