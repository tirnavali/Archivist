require "test_helper"

class RecordAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_attachment = record_attachments(:one)
  end

  test "should get index" do
    get record_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_record_attachment_url
    assert_response :success
  end

  test "should create record_attachment" do
    assert_difference("RecordAttachment.count") do
      post record_attachments_url, params: { record_attachment: { completed: @record_attachment.completed } }
    end

    assert_redirected_to record_attachment_url(RecordAttachment.last)
  end

  test "should show record_attachment" do
    get record_attachment_url(@record_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_attachment_url(@record_attachment)
    assert_response :success
  end

  test "should update record_attachment" do
    patch record_attachment_url(@record_attachment), params: { record_attachment: { completed: @record_attachment.completed } }
    assert_redirected_to record_attachment_url(@record_attachment)
  end

  test "should destroy record_attachment" do
    assert_difference("RecordAttachment.count", -1) do
      delete record_attachment_url(@record_attachment)
    end

    assert_redirected_to record_attachments_url
  end
end
