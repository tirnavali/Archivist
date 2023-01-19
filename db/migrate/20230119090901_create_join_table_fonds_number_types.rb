class CreateJoinTableFondsNumberTypes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :fonds, :number_types
  end
end
