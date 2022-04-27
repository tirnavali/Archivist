require "application_system_test_case"

class FondsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @fond = fonds(:first)
    @fond_related = fonds(:second)
  end

  # test "visiting the index" do
  #   visit fonds_url
  #   assert_selector "h1", text: "Fonds"
  # end

  test "should create fond" do
    visit fonds_url
    click_on "New fond"

    fill_in "Name", with: "new name"
    fill_in "Explanation", with: "new explanation"
    click_on "Fond Kaydet"
    assert_text "Fond was successfully created"
  end

  test "should create related fond" do
    visit fonds_url
    click_on "New fond"

    fill_in "Name", with: "Deneme deneme"
    fill_in "Explanation", with: @fond_related.explanation
    first(:xpath, "/html/body/div[2]/div[2]/form/div[3]/div").click()
    
    find('div.item', text: @fond_related.name).click()

    click_on ("Fond Kaydet")

    assert_text "Fond was successfully created"
  end

  test "should update Fond" do
    visit fond_url(@fond)
    click_on "Edit this fond", match: :first

    fill_in "Name", with: "Deneme deneme"
    fill_in "Explanation", with: @fond_related.explanation
    first(:xpath, "/html/body/div[2]/div[2]/form/div[3]/div").click()
    
    find('div.item', text: @fond_related.name).click()
    click_on "Fond Güncelle"

    assert_text "Fond was successfully updated"
    click_on "Back"
  end

  test "should destroy Fond" do
    visit fond_url(@fond)
    click_on "Destroy this fond", match: :first

    assert_text "Fond was successfully destroyed"
  end
end
