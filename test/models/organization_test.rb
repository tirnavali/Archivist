require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  test "valid organization" do
    t = Organization.new
    t.name= "Türk Tarih Kurumu"
    assert t.save
  end

  test "organization name can not empty" do
    t = Organization.new
    t.name= ""
    assert_not t.save
  end

  test "organization name must be smaller than 100 chars" do
    t = Organization.new
    t.name= "GWBDUWV744DWbI1vZerUmTi6A3gnw9CBBzlPpB5HG2yXxN3GiYf7tqsJxZDeYSD4lRIRIfLMZX1abe0N00ZDWLfpFQ4mdH0nc8mEcsv"
    assert_not t.save
  end

  test "organization name can not start and end with extra white spaces" do
    p = Organization.new
    p.name ="   Türk Tarih     Kurumu    "
    p.save
    assert_equal("Türk Tarih Kurumu", p.name)
  end

  test "organization name must be bigger than 2 chars" do
    t = Organization.new
    t.name= "de"
    assert_not t.save
  end

  test "organization name must be unique" do
    t1= Organization.new(name: "Türk Tarih Kurumu")
    t1.save
    t2= Organization.new(name: "Türk Tarih Kurumu")
    assert_not t2.save
  end

  test "very long valid organization" do
    t = Organization.new
    t.name= %q(8vnnrHyIExJUNhMVj4kta5VEG3ncJn-tp1WvRJPGUPP1oxf11UlbLKXSlQVnOr77-R4uQwZ9VIHxUt5x1Gh72hc5ikV1lkRlzQ)
    assert t.save
  end

  test "Organization name must be unique and case sensetive" do
    t1= Organization.new(name: "Türk Tarih Kurumu")
    t1.save
    t2= Organization.new(name: "Türk tarih Kurumu")
    assert_not t2.save
  end
end
