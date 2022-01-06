require "test_helper"

class ToponymsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @toponym = toponyms(:one)
  end

  test "should get index" do
    get toponyms_url
    assert_response :success
  end

  test "should get new" do
    get new_toponym_url
    assert_response :success
  end

  test "should create toponym" do
    assert_difference("Toponym.count") do
      post toponyms_url, params: { toponym: { name: @toponym.name } }
    end

    assert_redirected_to toponym_url(Toponym.last)
  end

  test "should show toponym" do
    get toponym_url(@toponym)
    assert_response :success
  end

  test "should get edit" do
    get edit_toponym_url(@toponym)
    assert_response :success
  end

  test "should update toponym" do
    patch toponym_url(@toponym), params: { toponym: { name: @toponym.name } }
    assert_redirected_to toponym_url(@toponym)
  end

  test "should destroy toponym" do
    assert_difference("Toponym.count", -1) do
      delete toponym_url(@toponym)
    end

    assert_redirected_to toponyms_url
  end
end
