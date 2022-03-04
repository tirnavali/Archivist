require "test_helper"

class RecordMetadatumTest < ActiveSupport::TestCase
  setup do
    @organization = Organization.create(name: "Turk tarih kurmu")
    @fond = Fond.create(name: "Test fon")
    @phisycal_status = PhisycalStatus.create(name: "Mahvolmuş")
    @privacy = Privacy.create(name: "hidden")
    @subject_1 = Subject.create(name: "tarih1")
    @subject_2 = Subject.create(name: "edebiyat2")
    @languages = Language.create([{name: "tr"},{name: "en"}])
    @document_types = DocumentType.create([{name: "evrak1"},{name: "belge1"}]) 
    @number_type = NumberType.create(name: "kararlarar")

  end

  test 'should save record_metadatum with special numbers' do
    record_metadatum = RecordMetadatum.new(
      summary: "1234567890",
      fond: @fond,
      organization: @organization,
      phisycal_status: @phisycal_status,
      privacy: @privacy,
      organization_code: "asdfasdfa",
      box: 12,
      folder: 123,
      order: 123123,
      starting_date: Date.today,
      ending_date: Date.tomorrow,
      explaination: "Yehuu",
      subjects: [@subject_1, @subject_2],
      languages: @languages,
      document_types: @document_types,
      special_numbers_attributes: [{
        number_type:@number_type,
        value: "asdfasdf"},
        {
        number_type:@number_type,
        value: "3456345"}
      ]
      )
    assert record_metadatum.valid?
    assert
  end
end
