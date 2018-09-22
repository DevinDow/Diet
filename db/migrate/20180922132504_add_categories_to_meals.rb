class AddCategoriesToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :categories, :json, default: []
  end
end
