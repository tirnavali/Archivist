require "application_system_test_case"

class RecordAttachmentsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @record_attachment = record_attachments(:one)
  end

  test "visiting the index" do
    visit record_attachments_url
    assert_selector "h1", text: "Record attachments"
  end

  test "should create record attachment" do
    visit record_attachments_url
    click_on "New record attachment"

    check "Completed" if @record_attachment.completed
    click_on "Create Record attachment"

    assert_text "Record attachment was successfully created"
    click_on "Back"
  end

  test "should update Record attachment" do
    visit record_attachment_url(@record_attachment)
    click_on "Edit this record attachment", match: :first

    check "Completed" if @record_attachment.completed
    click_on "Update Record attachment"

    assert_text "Record attachment was successfully updated"
    click_on "Back"
  end

  test "should destroy Record attachment" do
    visit record_attachment_url(@record_attachment)
    click_on "Destroy this record attachment", match: :first

    assert_text "Record attachment was successfully destroyed"
  end
end
