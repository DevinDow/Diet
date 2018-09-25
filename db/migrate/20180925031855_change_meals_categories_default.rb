class ChangeMealsCategoriesDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:meals, :categories, [0, 0, 0, 0, 0, 0, 0])
  end
end
