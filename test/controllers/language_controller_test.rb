require "test_helper"

class LanguageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get language_new_url
    assert_response :success
  end

  test "should get edit" do
    get language_edit_url
    assert_response :success
  end

  test "should get index" do
    get language_index_url
    assert_response :success
  end

  test "should get create" do
    get language_create_url
    assert_response :success
  end

  test "should get update" do
    get language_update_url
    assert_response :success
  end

  test "should get destroy" do
    get language_destroy_url
    assert_response :success
  end
end
