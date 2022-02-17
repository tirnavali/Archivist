class RemoveSpecialNumberIdDocuments < ActiveRecord::Migration[7.0]
  def change
    remove_column :documents, :special_number_id
  end
end
