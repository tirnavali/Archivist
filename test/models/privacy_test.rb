require "test_helper"

class PrivacyTest < ActiveSupport::TestCase
  test "valid privacy" do
    assert_difference 'Privacy.count' do
      Privacy.create! name: "Top Secret"
    end
  end

  test "privacy name can not empty" do
    t = Privacy.new
    t.name= ""
    assert_not t.save
  end

  test "name can not start and end with extra white spaces" do
    p = Privacy.new
    p.name ="   Çok    Gizli  "
    p.save
    assert_equal("Çok Gizli", p.name)
  end

  test "privacy name cannot be bigger than 20 chars" do
    t = Privacy.new
    t.name= "GWBDUWV744DWbI1vZerUmTi6A3gnw9CBBzlPpB5HG2yXxN3GiYf7tqsJxZDeYSD4lRIRIfLMZX1abe0N00ZDWLfpFQ4mdH0nc8mEcsv"
    assert_not t.save
  end

  test "privacy name can be equal 20 chars" do
    t = Privacy.new
    t.name= "genjGH1STRwyhMBGVAWD"
    assert t.save
  end

  test "privacy cannot be smaller than 3 chars" do
    t = Privacy.new
    t.name= "de"
    assert_not t.save
  end

  test "privacy name must be unique" do
    t1= Privacy.new(name: "Çok gizli")
    t1.save
    t2= Privacy.new(name: "Çok gizli")
    assert_not t2.save
  end
end
