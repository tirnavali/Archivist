require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @organization = organizations(:first)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: I18n.t("organizations")
  end

  test "should create organization" do
    visit organizations_url
    click_on I18n.t("new_organization")

    click_on I18n.t("save")

    assert_text "Organization was successfully created"
    click_on I18n.t("back_to_organizations")
  end

  test "should update Organization" do
    visit organization_url(@organization)
    click_on I18n.t("edit_this_organization"), match: :first

    click_on I18n.t("save")

    assert_text "Organization was successfully updated"
    click_on I18n.t("back_to_organizations")

  end

  test "should destroy Organization" do
    visit organization_url(@organization)
    click_on I18n.t("destroy"), match: :first

    assert_text "Organization was successfully destroyed"
  end
end
