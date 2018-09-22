class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.time :time
      t.string :foods
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end
