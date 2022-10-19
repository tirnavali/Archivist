require "test_helper"

class CollectionItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get collection_items_create_url
    assert_response :success
  end
end
