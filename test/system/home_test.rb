require "application_system_test_case"
class HomeTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
  end

  test "visiting the index" do
    visit root_path
    assert_selector "h1", text: "Tüm fonlarda ve belgelerde arayın..."
    
  end


end