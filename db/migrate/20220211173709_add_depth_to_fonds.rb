class AddDepthToFonds < ActiveRecord::Migration[7.0]
  def change
    add_column :fonds, :depth, :integer
  end
end
