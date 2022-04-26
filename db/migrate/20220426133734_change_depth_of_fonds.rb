class ChangeDepthOfFonds < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:fonds, :depth, from: nil, to: 0)
    change_column_null(:fonds, :depth, false)

  end
end
