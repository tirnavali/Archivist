require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "valid person" do
    assert_difference 'Person.count' do
      Person.create! name: "Sercan Tırnavalı"
    end
  end

  test "person name can not empty" do
    t = Person.new
    t.name= ""
    assert_not t.save
  end

  test "name can not start and end with extra white spaces" do
    p = Person.new
    p.name ="   Sercan    Tırnavalı  "
    p.save
    assert_equal("Sercan Tırnavalı", p.name)
  end

  test "person name cannot be bigger than 100 chars" do
    t = Person.new
    t.name= "7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiK7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiKr"
    assert_not t.save
  end

  test "person name can be equal 100 chars" do
    t = Person.new
    t.name= "7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiK7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiK"
    assert t.save
  end

  test "person cannot be smaller than 3 chars" do
    t = Person.new
    t.name= "de"
    assert_not t.save
  end

  test "person name must be unique" do
    t1= Person.new(name: "Sercan Tırnavalı")
    t1.save
    t2= Person.new(name: "Sercan Tırnavalı")
    assert_not t2.save
  end

  test "Person name must be unique and case sensetive" do
    t1= Person.new(name: "Sercan Tırnavalı")
    t1.save
    t2= Person.new(name: "sercan tırnavalı")
    assert_not t2.save
  end
end
