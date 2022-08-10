require "application_system_test_case"

class FondsTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @fond = fonds(:first)
    @fond_related = fonds(:second)
    visit fonds_url
  end

  test "visiting the index" do
    assert_selector "h1", text: I18n.t(:fonds)
    has_selector?('nav.pagination', count: 2)
  end

  test "should create fond" do
    click_on I18n.t("new_fond")
    fill_in :fond_name, with: "new name"
    fill_in :fond_explanation, with: "new explanation"
    click_on I18n.t('helpers.submit.create')
    assert_text I18n.t(:created_successfully)
  end

  test "should create related fond" do
    click_on I18n.t("new_fond")
    fill_in :fond_name, with: "Another new fond"
    fill_in :fond_explanation, with: "This is another new fond's explanation."
    first(:xpath, "/html/body/div[2]/div[2]/form/div[3]/div").click()
    find('div.item', text: @fond_related.name).click()
    click_on I18n.t('helpers.submit.create')
    assert_text I18n.t(:created_successfully)
  end

  test "should update fond" do
    visit fond_url(@fond)
    click_on "Edit this fond", match: :first
    fill_in :fond_name, with: "new name"
    fill_in :fond_explanation, with: @fond_related.explanation
    first(:xpath, "/html/body/div[2]/div[2]/form/div[3]/div").click()
    find('div.item', text: @fond_related.name).click()
    click_on I18n.t('helpers.submit.update')
    assert_text I18n.t(:updated_successfully)
  end

  test "should destroy fond" do
    visit fond_url(@fond)
    click_on I18n.t(:destroy), match: :first
    assert_text I18n.t(:destroyed_successfully)
  end

  test "should search fonds" do 
    fill_in :q_name_cont, with: @fond.name
    click_on "Ara"
    assert_text @fond.name
    assert_text @fond.id
    assert_text I18n.t("founded_record_size")
    find('div.search-result-size')
  end

  test "should search fonds with missing name" do 
    fill_in :q_name_cont, with: @fond.name.slice(1..3)
    click_on "Ara"
    assert_text @fond.name
    assert_text @fond.id
    assert_text I18n.t("founded_record_size")
    find('div.search-result-size')
    has_selector?('nav.pagination', count: 2)
  end

  test "should show empty page for empty results" do 
    fill_in :q_name_cont, with: "@#%&/()?*."
    click_on "Ara"
    assert(find('div.search-result-size').find('span', text: "0"))
    refute_select("table") # not to have table
  end

  test "should show sended query in search form" do
    query = "some long query"
    fill_in :q_name_cont, with: query
    click_on "Ara"
    assert(find("input#q_name_cont").value == query)
  end

  test "should clear sended query with clear button" do
    query = "some long query"
    fill_in :q_name_cont, with: query
    click_on "Ara"
    click_on "Temizle"
    assert(has_current_path?(fonds_path))
    refute_select("Temizle")
    assert(find("input#q_name_cont").value=="")
  end

end
