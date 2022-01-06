class RemoveSubjectsFromDocuments < ActiveRecord::Migration[7.0]
  def change
    remove_column :documents, :subject_id
  end
end
