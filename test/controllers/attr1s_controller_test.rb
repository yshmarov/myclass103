require 'test_helper'

class Attr1sControllerTest < ActionController::TestCase
  setup do
    @attr1 = attr1s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attr1s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attr1" do
    assert_difference('Attr1.count') do
      post :create, attr1: { attr1: @attr1.attr1 }
    end

    assert_redirected_to attr1_path(assigns(:attr1))
  end

  test "should show attr1" do
    get :show, id: @attr1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attr1
    assert_response :success
  end

  test "should update attr1" do
    patch :update, id: @attr1, attr1: { attr1: @attr1.attr1 }
    assert_redirected_to attr1_path(assigns(:attr1))
  end

  test "should destroy attr1" do
    assert_difference('Attr1.count', -1) do
      delete :destroy, id: @attr1
    end

    assert_redirected_to attr1s_path
  end
end
