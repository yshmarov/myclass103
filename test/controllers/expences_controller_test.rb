require 'test_helper'

class ExpencesControllerTest < ActionController::TestCase
  setup do
    @expence = expences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expence" do
    assert_difference('Expence.count') do
      post :create, expence: { amount: @expence.amount, description: @expence.description, user_id: @expence.user_id }
    end

    assert_redirected_to expence_path(assigns(:expence))
  end

  test "should show expence" do
    get :show, id: @expence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expence
    assert_response :success
  end

  test "should update expence" do
    patch :update, id: @expence, expence: { amount: @expence.amount, description: @expence.description, user_id: @expence.user_id }
    assert_redirected_to expence_path(assigns(:expence))
  end

  test "should destroy expence" do
    assert_difference('Expence.count', -1) do
      delete :destroy, id: @expence
    end

    assert_redirected_to expences_path
  end
end
