require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  setup do
    @enrollment = enrollments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrollments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference('enrollment.count') do
      post :create, enrollment: { coupon_id: @enrollment.coupon_id, event_group_id: @enrollment.event_group_id, opp_status_id: @enrollment.opp_status_id, service_id: @enrollment.service_id, user_id: @enrollment.user_id }
    end

    assert_redirected_to enrollment_path(assigns(:enrollment))
  end

  test "should show enrollment" do
    get :show, id: @enrollment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enrollment
    assert_response :success
  end

  test "should update enrollment" do
    patch :update, id: @enrollment, enrollment: { coupon_id: @enrollment.coupon_id, event_group_id: @enrollment.event_group_id, opp_status_id: @enrollment.opp_status_id, service_id: @enrollment.service_id, user_id: @enrollment.user_id }
    assert_redirected_to enrollment_path(assigns(:enrollment))
  end

  test "should destroy enrollment" do
    assert_difference('enrollment.count', -1) do
      delete :destroy, id: @enrollment
    end

    assert_redirected_to enrollments_path
  end
end
