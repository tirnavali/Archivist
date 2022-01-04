require "test_helper"

class SpecialNumberNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_number_name = special_number_names(:one)
  end

  test "should get index" do
    get special_number_names_url
    assert_response :success
  end

  test "should get new" do
    get new_special_number_name_url
    assert_response :success
  end

  test "should create special_number_name" do
    assert_difference("SpecialNumberName.count") do
      post special_number_names_url, params: { special_number_name: { name: @special_number_name.name } }
    end

    assert_redirected_to special_number_name_url(SpecialNumberName.last)
  end

  test "should show special_number_name" do
    get special_number_name_url(@special_number_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_number_name_url(@special_number_name)
    assert_response :success
  end

  test "should update special_number_name" do
    patch special_number_name_url(@special_number_name), params: { special_number_name: { name: @special_number_name.name } }
    assert_redirected_to special_number_name_url(@special_number_name)
  end

  test "should destroy special_number_name" do
    assert_difference("SpecialNumberName.count", -1) do
      delete special_number_name_url(@special_number_name)
    end

    assert_redirected_to special_number_names_url
  end
end
