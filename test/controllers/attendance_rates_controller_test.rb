require 'test_helper'

class AttendanceRatesControllerTest < ActionController::TestCase
  setup do
    @attendance_rate = attendance_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_rate" do
    assert_difference('AttendanceRate.count') do
      post :create, attendance_rate: { name: @attendance_rate.name, rate: @attendance_rate.rate }
    end

    assert_redirected_to attendance_rate_path(assigns(:attendance_rate))
  end

  test "should show attendance_rate" do
    get :show, id: @attendance_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance_rate
    assert_response :success
  end

  test "should update attendance_rate" do
    patch :update, id: @attendance_rate, attendance_rate: { name: @attendance_rate.name, rate: @attendance_rate.rate }
    assert_redirected_to attendance_rate_path(assigns(:attendance_rate))
  end

  test "should destroy attendance_rate" do
    assert_difference('AttendanceRate.count', -1) do
      delete :destroy, id: @attendance_rate
    end

    assert_redirected_to attendance_rates_path
  end
end
