require 'test_helper'

class Attr3sControllerTest < ActionController::TestCase
  setup do
    @attr3 = attr3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attr3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attr3" do
    assert_difference('Attr3.count') do
      post :create, attr3: { attr3: @attr3.attr3 }
    end

    assert_redirected_to attr3_path(assigns(:attr3))
  end

  test "should show attr3" do
    get :show, id: @attr3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attr3
    assert_response :success
  end

  test "should update attr3" do
    patch :update, id: @attr3, attr3: { attr3: @attr3.attr3 }
    assert_redirected_to attr3_path(assigns(:attr3))
  end

  test "should destroy attr3" do
    assert_difference('Attr3.count', -1) do
      delete :destroy, id: @attr3
    end

    assert_redirected_to attr3s_path
  end
end
