require "test_helper"

class SpecialNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_number = special_numbers(:one)
  end

  test "should get index" do
    get special_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_special_number_url
    assert_response :success
  end

  test "should create special_number" do
    assert_difference("SpecialNumber.count") do
      post special_numbers_url, params: { special_number: { number: @special_number.number, special_number_name_id: @special_number.special_number_name_id } }
    end

    assert_redirected_to special_number_url(SpecialNumber.last)
  end

  test "should show special_number" do
    get special_number_url(@special_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_number_url(@special_number)
    assert_response :success
  end

  test "should update special_number" do
    patch special_number_url(@special_number), params: { special_number: { number: @special_number.number, special_number_name_id: @special_number.special_number_name_id } }
    assert_redirected_to special_number_url(@special_number)
  end

  test "should destroy special_number" do
    assert_difference("SpecialNumber.count", -1) do
      delete special_number_url(@special_number)
    end

    assert_redirected_to special_numbers_url
  end
end
