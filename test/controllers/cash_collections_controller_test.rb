require 'test_helper'

class CashCollectionsControllerTest < ActionController::TestCase
  setup do
    @cash_collection = cash_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_collection" do
    assert_difference('CashCollection.count') do
      post :create, cash_collection: { admin_id: @cash_collection.admin_id, amount: @cash_collection.amount, office_id: @cash_collection.office_id }
    end

    assert_redirected_to cash_collection_path(assigns(:cash_collection))
  end

  test "should show cash_collection" do
    get :show, id: @cash_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_collection
    assert_response :success
  end

  test "should update cash_collection" do
    patch :update, id: @cash_collection, cash_collection: { admin_id: @cash_collection.admin_id, amount: @cash_collection.amount, office_id: @cash_collection.office_id }
    assert_redirected_to cash_collection_path(assigns(:cash_collection))
  end

  test "should destroy cash_collection" do
    assert_difference('CashCollection.count', -1) do
      delete :destroy, id: @cash_collection
    end

    assert_redirected_to cash_collections_path
  end
end
