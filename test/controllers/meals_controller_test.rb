require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:day1)
    @meal = meals(:breakfast)
  end

  test "should get index" do
    get day_meals_url(@meal.day)
    assert_response :success
  end

  test "should get new" do
    get new_day_meal_url(@day)
    assert_response :success
  end

  test "should create meal" do
    assert_difference('Meal.count') do
      post day_meals_url(@meal.day), params: { meal: { foods: @meal.foods, time: @meal.time } }
    end

    assert_redirected_to day_url(@meal.day)
  end

  test "should show meal" do
    get meal_url(@meal)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_url(@meal)
    assert_response :success
  end

  test "should update meal" do
    patch meal_url(@meal), params: { meal: { day_id: @meal.day_id, foods: @meal.foods, time: @meal.time } }
    assert_redirected_to day_url(@meal.day)
  end

  test "should destroy meal" do
    day = @meal.day
    assert_difference('Meal.count', -1) do
      delete meal_url(@meal)
    end

    assert_redirected_to day_url(day)
  end
end
