require "test_helper"

class RecordMetadataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_metadatum = record_metadata(:one)
  end

  test "should get index" do
    get record_metadata_url
    assert_response :success
  end

  test "should get new" do
    get new_record_metadatum_url
    assert_response :success
  end

  test "should create record_metadatum" do
    assert_difference("RecordMetadatum.count") do
      post record_metadata_url, params: { record_metadatum: { summary: @record_metadatum.summary } }
    end

    assert_redirected_to record_metadatum_url(RecordMetadatum.last)
  end

  test "should show record_metadatum" do
    get record_metadatum_url(@record_metadatum)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_metadatum_url(@record_metadatum)
    assert_response :success
  end

  test "should update record_metadatum" do
    patch record_metadatum_url(@record_metadatum), params: { record_metadatum: { summary: @record_metadatum.summary } }
    assert_redirected_to record_metadatum_url(@record_metadatum)
  end

  test "should destroy record_metadatum" do
    assert_difference("RecordMetadatum.count", -1) do
      delete record_metadatum_url(@record_metadatum)
    end

    assert_redirected_to record_metadata_url
  end
end
