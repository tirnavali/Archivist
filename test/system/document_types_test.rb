require "application_system_test_case"

class DocumentTypesTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @document_type = document_types(:first)
  end

  test "visiting the index" do
    visit document_types_url
    assert_selector "h1", text: "Document types"
  end

  test "should create document type" do
    visit document_types_url
    click_on "New document type"

    fill_in "Name", with: @document_type.name
    click_on "Create Document type"

    assert_text "Document type was successfully created"
    click_on "Back"
  end

  test "should update Document type" do
    visit document_type_url(@document_type)
    click_on "Edit this document type", match: :first

    fill_in "Name", with: @document_type.name
    click_on "Update Document type"

    assert_text "Document type was successfully updated"
    click_on "Back"
  end

  test "should destroy Document type" do
    visit document_type_url(@document_type)
    click_on "Destroy this document type", match: :first

    assert_text "Document type was successfully destroyed"
  end
end
