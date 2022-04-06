require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  test "valid phisycal status" do
    assert_difference 'Subject.count' do
      Subject.create! name: "Pandemi"
    end
  end

  test "subject name can not empty" do
    p = Subject.new
    p.name= ""
    assert_not p.save
  end

  test "name can not start and end with extra white spaces" do
    p = Subject.new
    p.name ="   türkler ve   moğollar  "
    p.save
    assert_equal("türkler ve moğollar", p.name)
  end

  test "subject name cannot be bigger than 50 chars" do
    t = Subject.new
    t.name= "7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiKer"
    assert_not t.save
  end

  test "subject name can be equal 50 chars" do
    t = Subject.new
    t.name= "7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiK"
    assert t.save
  end

  test "subject cannot be smaller than 3 chars" do
    t = Subject.new
    t.name= "de"
    assert_not t.save
  end

  test "subject name must be unique" do
    t1= Subject.new(name: "türkler ve moğollar")
    t1.save
    t2= Subject.new(name: "türkler ve moğollar")
    assert_not t2.save
  end

  test "Subject name must be unique and case sensetive" do
    t1= Subject.new(name: "türkler ve moğollar")
    t1.save
    t2= Subject.new(name: "Türkler Ve moğollar")
    assert_not t2.save
  end
end
