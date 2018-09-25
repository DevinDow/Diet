class RemoveBmsFromDays < ActiveRecord::Migration[5.2]
  def change
    remove_column :days, :bms
  end
end
