require "test_helper"

class NumberTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @number_type = number_types(:one)
  end

  test "should get index" do
    get number_types_url
    assert_response :success
  end

  test "should get new" do
    get new_number_type_url
    assert_response :success
  end

  test "should create number_type" do
    assert_difference("NumberType.count") do
      post number_types_url, params: { number_type: { name: @number_type.name } }
    end

    assert_redirected_to number_type_url(NumberType.last)
  end

  test "should show number_type" do
    get number_type_url(@number_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_number_type_url(@number_type)
    assert_response :success
  end

  test "should update number_type" do
    patch number_type_url(@number_type), params: { number_type: { name: @number_type.name } }
    assert_redirected_to number_type_url(@number_type)
  end

  test "should destroy number_type" do
    assert_difference("NumberType.count", -1) do
      delete number_type_url(@number_type)
    end

    assert_redirected_to number_types_url
  end
end
