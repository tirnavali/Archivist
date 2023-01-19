class AddCodeToFonds < ActiveRecord::Migration[7.0]
  def change
    add_column :fonds, :code, :string
  end
end
