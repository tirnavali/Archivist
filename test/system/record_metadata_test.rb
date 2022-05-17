require "application_system_test_case"

class RecordMetadataTest < ApplicationSystemTestCase
  #self.use_instantiated_fixtures = true

  setup do
    login_as users(:admin)
    @record_metadatum = record_metadata(:first)
    @subject = @record_metadatum.subjects.first
    @toponym = @record_metadatum.toponyms.first
    @person = people(:first)
    @number_type_first = number_types(:first)
    @fond = fonds(:first)
  end

  test "visiting the index" do
    visit record_metadata_url
    assert_selector "h1", text: I18n.t("record_metadata")
  end

  test "should create record metadatum" do
    visit root_path
    click_on I18n.t("record_metadata")
    
    click_on I18n.t("new_record_metadatum")
    
    first(".select2-selection__arrow", maximum: 10).click
    find('li.select2-results__option[role="option"]', text: @fond.name).click

    fill_in "record_metadatum_organization_code", with: @record_metadatum.organization_code
    fill_in "record_metadatum_box", with: @record_metadatum.box
    fill_in "record_metadatum_folder", with: @record_metadatum.folder
    fill_in "record_metadatum_order", with: @record_metadatum.order
    fill_in "record_metadatum_summary", with: @record_metadatum.summary
    fill_in "record_metadatum_explaination", with: @record_metadatum.explaination
    fill_in "record_metadatum_starting_date", with: @record_metadatum.starting_date
    fill_in "record_metadatum_ending_date", with: @record_metadatum.ending_date

    first(:xpath,'//*[@id="new_record_metadatum"]/div[4]/div/div/div[2]/div/input').click
    # ikinci sıradaki özel no seçildi
    first(:xpath, '//*[@id="new_record_metadatum"]/div[4]/div/div/div[2]/div/div[2]/div[2]').click
    fill_in "record_metadatum[special_numbers_attributes][0][value]", with: "Test Value"

    click_link "Numara ekle"
    
    first(:xpath,'//*[@id="new_record_metadatum"]/div[4]/div[1]/div[2]/div/input').click
    # birinci sıradaki özel no seçildi
    first('div', text: @number_type_first.name).click
    first(:xpath, '//*[@id="new_record_metadatum"]/div[4]/div[1]/div[1]/input').fill_in with: "Test Value 2"



    find(".record_metadatum_subjects").find(".select2-search__field").fill_in  with: @subject.name
    first('li.select2-results__option[role="option"]', text: @subject.name).click

    find(".record_metadatum_subjects").find(".select2-search__field").fill_in  with: @record_metadatum.subjects.second.name
    first('li.select2-results__option[role="option"]', text:  @record_metadatum.subjects.second.name).click

    find(".record_metadatum_people").find(".select2-search__field").fill_in  with: @person.name
    first('li.select2-results__option[role="option"]', wait:10, text: @person.name).click

    find(".record_metadatum_people").find(".select2-search__field").fill_in  with: @record_metadatum.people.second.name
    first('li.select2-results__option[role="option"]', wait:10, text: @record_metadatum.people.second.name).click

    find(".record_metadatum_toponyms").find(".select2-search__field").fill_in  with: @toponym.name 
    first('li.select2-results__option[role="option"]', text: @toponym.name).click

    find(".record_metadatum_toponyms").find(".select2-search__field").fill_in  with: @record_metadatum.toponyms.second.name 
    first('li.select2-results__option[role="option"]', text: @record_metadatum.toponyms.second.name).click

    find(".record_metadatum_organization").click
    first('input.select2-search__field[aria-controls="select2-organizations-dropdown-results"]', maximum: 10).fill_in with: @record_metadatum.organization.name
    first('li.select2-results__option[role="option"]', text: @record_metadatum.organization.name).click

    check("record_metadatum_language_ids_#{@record_metadatum.languages.first.id}",allow_label_click: true)
    check("record_metadatum_document_type_ids_#{@record_metadatum.document_types.first.id}",allow_label_click: true)
    choose("record_metadatum_privacy_id_#{@record_metadatum.privacy.id}",allow_label_click: true)
    choose("record_metadatum_phisycal_status_id_#{@record_metadatum.phisycal_status.id}",allow_label_click: true)

    # :xpath, ile seçmek için
    # first(:xpath, '//*[@id="new_record_metadatum"]/div[12]/div/div[3]/div/div/div[1]/label', visible: false).click()

    click_on I18n.t("save")

    assert_text "Record metadatum was successfully created"
    assert_text "Bu kayıda ilişkin üstveriler"
    assert_text "New record attachment"
  end

  # test "should update Record metadatum" do
  #   visit record_metadatum_url(@record_metadatum)
  #   click_on "Edit this record metadatum", match: :first

  #   fill_in "Summary", with: @record_metadatum.summary
  #   click_on "Update Record metadatum"

  #   assert_text "Record metadatum was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Record metadatum" do
  #   visit record_metadatum_url(@record_metadatum)
  #   click_on "Destroy this record metadatum", match: :first

  #   assert_text "Record metadatum was successfully destroyed"
  # end
end
