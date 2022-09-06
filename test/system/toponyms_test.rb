require "application_system_test_case"

class ToponymsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @toponym = toponyms(:first)
    visit toponyms_url
  end

  test "visiting the index" do
    assert_selector "h1", text: I18n.t("toponyms")
  end

  test "should create toponym" do
    click_on I18n.t("new_toponym")

    fill_in "toponym_name", with: "Yer adı testi"
    click_on I18n.t("save")

    assert_selector "div", text: "Yer adı testi"
    assert_selector "turbo-frame.row", count: 15
    assert_text "Toponym was successfully created"
  end

  test "should cancel creating toponym" do
    click_on I18n.t("new_toponym")

    fill_in "toponym_name", with: "Yer adı testi"
    click_on I18n.t("cancel")
    assert_selector "turbo-frame.row", count: 15
  end

  test "should update Toponym" do
    find("a#toponym_#{@toponym.id}").click()
    assert_text "Editing toponym"

    fill_in "toponym_name", with: "UPGRADES!"
    click_on I18n.t("helpers.submit.update")
    assert_selector "div", text: "UPGRADES!"
    
    assert_text "Toponym was successfully updated."
  end

  test "should cancel update Toponym" do
    find("a#toponym_#{@toponym.id}").click()
    assert_text "Editing toponym"

    fill_in "toponym_name", with: "UPGRADES!"
    click_on I18n.t("cancel")
    assert_selector "div", text: @toponym.name

  end

  # test "should destroy Toponym" do
  #   visit toponym_url(@toponym)
  #   click_on "Destroy this toponym", match: :first

  #   assert_text "Toponym was successfully destroyed"
  # end
end
