class ChangeDateType < ActiveRecord::Migration[5.0]
  def change
    change_column :rounds, :date, :string
  end
end
