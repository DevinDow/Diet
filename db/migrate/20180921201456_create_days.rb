class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :date
      t.string :plan
      t.string :fitness
      t.string :bms
      t.text :notes

      t.timestamps
    end
  end
end
