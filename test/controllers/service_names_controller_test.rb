require 'test_helper'

class ServiceNamesControllerTest < ActionController::TestCase
  setup do
    @service_name = service_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_name" do
    assert_difference('ServiceName.count') do
      post :create, service_name: { name: @service_name.name }
    end

    assert_redirected_to service_name_path(assigns(:service_name))
  end

  test "should show service_name" do
    get :show, id: @service_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_name
    assert_response :success
  end

  test "should update service_name" do
    patch :update, id: @service_name, service_name: { name: @service_name.name }
    assert_redirected_to service_name_path(assigns(:service_name))
  end

  test "should destroy service_name" do
    assert_difference('ServiceName.count', -1) do
      delete :destroy, id: @service_name
    end

    assert_redirected_to service_names_path
  end
end
