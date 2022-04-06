require "test_helper"

class FondTest < ActiveSupport::TestCase
  test "valid fond" do
    assert_difference 'Fond.count' do
      Fond.create! name: "Kanunlar kararlar"
    end
  end

  test "fond name and explaination can not empty" do
    t = Fond.new
    t.name= ""
    t.explanation = ""
    assert_not t.save
  end

  test "name can not start and end with extra white spaces" do
    p = Fond.new
    p.name ="   Kanunlar      kararlar      "
    p.save
    assert_equal("Kanunlar kararlar", p.name)
  end

  test "fond name cannot be bigger than 100 chars" do
    t = Fond.new
    t.name= "7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiK7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiKr"
    assert_not t.save
  end

  test "fond name can be equal 100 chars" do
    t = Fond.new
    t.name= "7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiK7smaTE9GI409qYtjZurT3fXwwFzDte65vOyUNM77GgxqEkxWiK"
    assert t.save
  end

  test "fond cannot be smaller than 3 chars" do
    t = Fond.new
    t.name= "de"
    assert_not t.save
  end

  test "fond name must be unique" do
    t1= Fond.new(name: "Kanunlar kararlar")
    t1.save
    t2= Fond.new(name: "Kanunlar kararlar")
    assert_not t2.save
  end

  test "Fond name must be unique and case sensetive" do
    t1= Fond.new(name: "Kanunlar kararlar")
    t1.save
    t2= Fond.new(name: "Kanunlar Kararlar")
    assert_not t2.save
  end
end
