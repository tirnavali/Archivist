require "application_system_test_case"

class VacationsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @vacation = vacations(:first)


  end

  test "visiting the vacations index" do
        
    visit vacations_url
    assert_selector "h1", text: "Vacations"
  end

  test "should create vacation" do
    visit vacations_url
    click_on "New vacation"

    fill_in "Ending date", with: @vacation.ending_date
    fill_in "Explanation", with: @vacation.explanation
    fill_in "Starting date", with: @vacation.starting_date
    fill_in "User", with: @vacation.user_id
    click_on "Create Vacation"

    assert_text "Vacation was successfully created"
    click_on "Back"
  end

  test "should update Vacation" do
    visit vacation_url(@vacation)
    click_on "Edit this vacation", match: :first

    fill_in "Ending date", with: @vacation.ending_date
    fill_in "Explanation", with: @vacation.explanation
    fill_in "Starting date", with: @vacation.starting_date
    fill_in "User", with: @vacation.user_id
    click_on "Update Vacation"

    assert_text "Vacation was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacation" do
    visit vacation_url(@vacation)
    click_on "Destroy this vacation", match: :first

    assert_text "Vacation was successfully destroyed"
  end
end
