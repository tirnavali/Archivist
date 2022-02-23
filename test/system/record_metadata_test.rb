require "application_system_test_case"

class RecordMetadataTest < ApplicationSystemTestCase
  setup do
    @record_metadatum = record_metadata(:one)
  end

  test "visiting the index" do
    visit record_metadata_url
    assert_selector "h1", text: "Record metadata"
  end

  test "should create record metadatum" do
    visit record_metadata_url
    click_on "New record metadatum"

    fill_in "Summary", with: @record_metadatum.summary
    click_on "Create Record metadatum"

    assert_text "Record metadatum was successfully created"
    click_on "Back"
  end

  test "should update Record metadatum" do
    visit record_metadatum_url(@record_metadatum)
    click_on "Edit this record metadatum", match: :first

    fill_in "Summary", with: @record_metadatum.summary
    click_on "Update Record metadatum"

    assert_text "Record metadatum was successfully updated"
    click_on "Back"
  end

  test "should destroy Record metadatum" do
    visit record_metadatum_url(@record_metadatum)
    click_on "Destroy this record metadatum", match: :first

    assert_text "Record metadatum was successfully destroyed"
  end
end
