require "application_system_test_case"

class Admin::CollectionsTest < ApplicationSystemTestCase
  setup do
    @admin_collection = admin_collections(:one)
  end

  test "visiting the index" do
    visit admin_collections_url
    assert_selector "h1", text: "Collections"
  end

  test "should create collection" do
    visit admin_collections_url
    click_on "New collection"

    fill_in "Title", with: @admin_collection.title
    fill_in "User", with: @admin_collection.user_id
    click_on "Create Collection"

    assert_text "Collection was successfully created"
    click_on "Back"
  end

  test "should update Collection" do
    visit admin_collection_url(@admin_collection)
    click_on "Edit this collection", match: :first

    fill_in "Title", with: @admin_collection.title
    fill_in "User", with: @admin_collection.user_id
    click_on "Update Collection"

    assert_text "Collection was successfully updated"
    click_on "Back"
  end

  test "should destroy Collection" do
    visit admin_collection_url(@admin_collection)
    click_on "Destroy this collection", match: :first

    assert_text "Collection was successfully destroyed"
  end
end
