class AddExplanationToFonds < ActiveRecord::Migration[7.0]
  def change
    add_column :fonds, :explanation, :text
  end
end
