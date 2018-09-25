json.extract! day, :id, :date, :plan, :fitness, :notes, :created_at, :updated_at
json.url day_url(day, format: :json)
#json.meals @day.meals { |meal| json.partial! "meals/meal", meal: meal }  # put meals in show instead of in _day so that meals are returned for one day but not for index of all days
