require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
   
  setup do 
    @user = User.create!(email: "sercan@gmail.com", password: "12345678", role: 0)
    @superadmin = User.create!(email: "sercansuperadmin@gmail.com", password: "12345678", role: 1)
  end

  test "user should get users index" do
    sign_in @user
    get users_path
    assert_response :success
  end

  test "user should get show page" do
    sign_in @user
    get users_path(@users)
    assert_response :success
  end

  test "user cannot get edit user page" do
    sign_in @user
    get edit_user_path @user.id
    assert_response :redirect
  end

  test "user cannot delete user" do 

  test "superuser can get edit user page" do
    sign_in @superadmin
    get edit_user_path @superadmin
    
    assert_response :success
  end


end
