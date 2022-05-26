class AddPhisycalStatusToDocuments < ActiveRecord::Migration[7.0]
  def change
    # add_reference :documents, :phisycal_status, null: true, foreign_key: true
  end
end
