class CreateDocumentsLanguagesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :documents, :languages
  end
end
