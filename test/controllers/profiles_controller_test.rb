require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { address: @profile.address, birthday: @profile.birthday, email: @profile.email, first_name: @profile.first_name, last_name: @profile.last_name, lead_source: @profile.lead_source, photo: @profile.photo, second_name: @profile.second_name, sex: @profile.sex, user_id: @profile.user_id }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { address: @profile.address, birthday: @profile.birthday, email: @profile.email, first_name: @profile.first_name, last_name: @profile.last_name, lead_source: @profile.lead_source, photo: @profile.photo, second_name: @profile.second_name, sex: @profile.sex, user_id: @profile.user_id }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
