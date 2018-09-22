require 'test_helper'

class DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day1 = days(:day1)
  end

  test "should get index" do
    get days_url
    assert_response :success
  end

  test "should get new" do
    get new_day_url
    assert_response :success
  end

  test "should create day" do
    assert_difference('Day.count') do
      post days_url, params: { day: { bms: @day1.bms, date: @day1.date, fitness: @day1.fitness, notes: @day1.notes, plan: @day1.plan } }
    end

    assert_redirected_to day_url(Day.last)
  end

  test "should show day" do
    get day_url(@day1)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_url(@day1)
    assert_response :success
  end

  test "should update day" do
    patch day_url(@day1), params: { day: { bms: @day1.bms, date: @day1.date, fitness: @day1.fitness, notes: @day1.notes, plan: @day1.plan } }
    assert_redirected_to day_url(@day1)
  end

  test "should destroy day" do
    assert_difference('Day.count', -1) do
      delete day_url(@day1)
    end

    assert_redirected_to days_url
  end
end
