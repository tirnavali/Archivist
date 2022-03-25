require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:first)

    visit new_user_session_path
    assert_selector "h2", text: "Log-in to your account"

    fill_in "Email", with: "tran.ce.co@gmail.com"
    fill_in "Password", with: "123456"
    click_on "Log in"
    assert_selector "h1", text: "Home page"

  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "should create organization" do
    visit organizations_url
    click_on "New organization"

    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "should update Organization" do
    visit organization_url(@organization)
    click_on "Edit this organization", match: :first

    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization" do
    visit organization_url(@organization)
    click_on "Destroy this organization", match: :first

    assert_text "Organization was successfully destroyed"
  end
end
