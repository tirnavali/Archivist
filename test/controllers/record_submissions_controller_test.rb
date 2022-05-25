require "test_helper"

class RecordSubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get record_submissions_index_url
    assert_response :success
  end
end
