class RenameTimeToMinutesSinceMidnightInMeals < ActiveRecord::Migration[5.2]
  def change
    rename_column :meals, :time, :minutes_since_midnight
  end
end
