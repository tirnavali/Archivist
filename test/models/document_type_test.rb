require "test_helper"

class DocumentTypeTest < ActiveSupport::TestCase
  test "valid document type" do
    assert_difference 'DocumentType.count' do
      DocumentType.create! name: "Haritam"
    end
  end

  test "document type name can not empty" do
    p = DocumentType.new
    p.name= ""
    assert_not p.save
  end

  test "name can not start and end with extra white spaces" do
    p = DocumentType.new
    p.name ="   Belge   "
    p.save
    assert_equal("Belge", p.name)
  end

  test "document type name cannot be bigger than 20 chars" do
    t = DocumentType.new
    t.name= "GWBDUWV744DWbI1vZerUmTi6A3gnw9CBBzlPpB5HG2yXxN3GiYf7tqsJxZDeYSD4lRIRIfLMZX1abe0N00ZDWLfpFQ4mdH0nc8mEcsv"
    assert_not t.save
  end

  test "document type name can be equal 20 chars" do
    t = DocumentType.new
    t.name= "genjGH1STRwyhMBGVAWD"
    assert t.save
  end

  test "document type cannot be smaller than 3 chars" do
    t = DocumentType.new
    t.name= "de"
    assert_not t.save
  end

  test "document type name must be unique" do
    t1= DocumentType.new(name: "Belge")
    t1.save
    t2= DocumentType.new(name: "Belge")
    assert_not t2.save
  end

  test "document type name must be unique and case sensetive" do
    t1= DocumentType.new(name: "Belge")
    t1.save
    t2= DocumentType.new(name: "belge")
    assert_not t2.save
  end
end
