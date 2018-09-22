require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day1 = days(:day1)
    @breakfast = meals(:breakfast)
  end

  test "should get index" do
    get day_meals_url(@breakfast.day)
    assert_response :success
  end

  test "should get new" do
    get new_day_meal_url(@day1)
    assert_response :success
  end

  test "should create meal" do
    assert_difference('Meal.count') do
      post day_meals_url(@breakfast.day), params: { meal: { foods: @breakfast.foods, time: @breakfast.time } }
    end

    assert_redirected_to day_url(@breakfast.day)
  end

  test "should show meal" do
    get meal_url(@breakfast)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_url(@breakfast)
    assert_response :success
  end

  test "should update meal" do
    patch meal_url(@breakfast), params: { meal: { foods: @breakfast.foods, time: @breakfast.time } }
    assert_redirected_to day_url(@breakfast.day)
  end

  test "should destroy meal" do
    day = @breakfast.day
    assert_difference('Meal.count', -1) do
      delete meal_url(@breakfast)
    end

    assert_redirected_to day_url(day)
  end
end
