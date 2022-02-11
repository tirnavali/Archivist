require "test_helper"

class FondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fond = fonds(:one)
  end

  test "should get index" do
    get fonds_url
    assert_response :success
  end

  test "should get new" do
    get new_fond_url
    assert_response :success
  end

  test "should create fond" do
    assert_difference("Fond.count") do
      post fonds_url, params: { fond: { Fond_id: @fond.Fond_id, name: @fond.name } }
    end

    assert_redirected_to fond_url(Fond.last)
  end

  test "should show fond" do
    get fond_url(@fond)
    assert_response :success
  end

  test "should get edit" do
    get edit_fond_url(@fond)
    assert_response :success
  end

  test "should update fond" do
    patch fond_url(@fond), params: { fond: { Fond_id: @fond.Fond_id, name: @fond.name } }
    assert_redirected_to fond_url(@fond)
  end

  test "should destroy fond" do
    assert_difference("Fond.count", -1) do
      delete fond_url(@fond)
    end

    assert_redirected_to fonds_url
  end
end
