require "test_helper"

class PhisycalStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phisycal_status = phisycal_statuses(:one)
  end

  test "should get index" do
    get phisycal_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_phisycal_status_url
    assert_response :success
  end

  test "should create phisycal_status" do
    assert_difference("PhisycalStatus.count") do
      post phisycal_statuses_url, params: { phisycal_status: { name: @phisycal_status.name } }
    end

    assert_redirected_to phisycal_status_url(PhisycalStatus.last)
  end

  test "should show phisycal_status" do
    get phisycal_status_url(@phisycal_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_phisycal_status_url(@phisycal_status)
    assert_response :success
  end

  test "should update phisycal_status" do
    patch phisycal_status_url(@phisycal_status), params: { phisycal_status: { name: @phisycal_status.name } }
    assert_redirected_to phisycal_status_url(@phisycal_status)
  end

  test "should destroy phisycal_status" do
    assert_difference("PhisycalStatus.count", -1) do
      delete phisycal_status_url(@phisycal_status)
    end

    assert_redirected_to phisycal_statuses_url
  end
end
