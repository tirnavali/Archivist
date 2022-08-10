require "application_system_test_case"

class ToponymsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @toponym = toponyms(:first)
    visit toponyms_url
  end

  test "visiting the index" do
    assert_selector "h1", text: t("toponyms")
  end

  test "should create toponym" do
    click_on I18n.t("new_toponym")

    fill_in "Name", with: @toponym.name
    click_on "Create Toponym"

    assert_text "Toponym was successfully created"
    click_on "Back"
  end

  # test "should update Toponym" do
  #   visit toponym_url(@toponym)
  #   click_on "Edit this toponym", match: :first

  #   fill_in "Name", with: @toponym.name
  #   click_on "Update Toponym"

  #   assert_text "Toponym was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Toponym" do
  #   visit toponym_url(@toponym)
  #   click_on "Destroy this toponym", match: :first

  #   assert_text "Toponym was successfully destroyed"
  # end
end
