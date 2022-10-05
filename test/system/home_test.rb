require "application_system_test_case"
class HomeTest < ApplicationSystemTestCase
  setup do
    login_as users(:admin)
    @fond =  fonds(:second)
    @fond_record_metadata_size = @fond.record_metadata.size
    @record_metadatum = record_metadata(:first)
    @document_type = document_types(:first)
    visit root_path
  end

  test "visiting the index" do
    assert_selector "h1", text: "Tüm fonlarda ve belgelerde arayın..."
  end

  test "make correct simple query" do
    fill_in "query", with: "Lorem"
    click_on "commit"
    assert_selector "b", text: "Bulunan kayıt sayısı:"
    assert_link text: I18n.t(:show)
  end

  test "search with fond" do
    first(".ui.fluid.search.selection.dropdown").fill_in(with: @fond.name)
    first(".item", text: @fond.name).click
    click_on "commit"
    assert_selector "p", text: "Bulunan kayıt sayısı: #{@fond_record_metadata_size}"
  end

  test "search with fond and query" do
    first(".ui.fluid.search.selection.dropdown").fill_in(with: @fond.name)
    first(".item", text: @fond.name).click
    fill_in "query", with: "Lorem"
    click_on "commit"
    assert_selector "b", text: "Bulunan kayıt sayısı:"
  end

  test "search with gibbrish" do
    fill_in "query", with: "Lorem1235?-0*9ğüşipüiüş"
    click_on "commit"
    assert_selector "h1", text: "Aramanızla ilgili hiç bir sonuç bulunamadı."
  end

  test "search with box" do
    first(".title").click #additional options
    fill_in "box", with: @record_metadatum.box
    fill_in "folder", with: @record_metadatum.folder
    fill_in "order", with: @record_metadatum.order

    click_on "commit"
    assert_selector "b", text: "Bulunan kayıt sayısı:"
  end

  test "search with number type all" do 
    fill_in "number_types[text]", with: @record_metadatum.special_numbers.first.value
    click_on "commit"
    assert_selector "b", text: "Bulunan kayıt sayısı:"
  end
  
  test "search with number type specific" do 
    find("#special_numbers_section").find(".ui.selection.dropdown").click
    first(".item", text: @record_metadatum.special_numbers.first.number_type.name ).click
    fill_in "number_types[text]", with: @record_metadatum.special_numbers.first.value
    click_on "commit"
    assert_selector "b", text: "Bulunan kayıt sayısı:"
  end

  test "search with document types" do
    check "document_type_ids_#{@document_type.id}"
    click_on "commit"
    assert_selector "b", text: "Bulunan kayıt sayısı:"
  end

  test "search with all languages types" do
    all("input[type=checkbox]", id: /language_ids.*/).each do |element|
      element.check
    end 
    click_on "commit"
    assert_selector "b", text: "Bulunan kayıt sayısı:"
  end

  test "search with secret " do
    click_on "commit"
    assert all(".ui.items .item").size == RecordMetadatum.count(:id) 
    check "is_secret"
    click_on "commit"
    assert_selector "p", text: "Bulunan kayıt sayısı: #{RecordMetadatum.where(is_secret: :true).size}"
  end

  test "search with not secret " do
    click_on "commit"
    assert all(".ui.items .item").size == RecordMetadatum.count(:id) 
    check "not_secret"
    click_on "commit"
    assert_selector "p", text: "Bulunan kayıt sayısı: #{RecordMetadatum.where(is_secret: :false).size}"
  end
end