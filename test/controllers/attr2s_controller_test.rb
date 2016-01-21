require 'test_helper'

class Attr2sControllerTest < ActionController::TestCase
  setup do
    @attr2 = attr2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attr2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attr2" do
    assert_difference('Attr2.count') do
      post :create, attr2: { attr2: @attr2.attr2 }
    end

    assert_redirected_to attr2_path(assigns(:attr2))
  end

  test "should show attr2" do
    get :show, id: @attr2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attr2
    assert_response :success
  end

  test "should update attr2" do
    patch :update, id: @attr2, attr2: { attr2: @attr2.attr2 }
    assert_redirected_to attr2_path(assigns(:attr2))
  end

  test "should destroy attr2" do
    assert_difference('Attr2.count', -1) do
      delete :destroy, id: @attr2
    end

    assert_redirected_to attr2s_path
  end
end
