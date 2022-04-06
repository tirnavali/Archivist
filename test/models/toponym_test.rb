require "test_helper"

class ToponymTest < ActiveSupport::TestCase
  test "valid toponym" do
    t = Toponym.new
    t.name= "Irak"
    assert t.save
  end

  test "toponym name can not empty" do
    t = Toponym.new
    t.name= ""
    assert_not t.save
  end

  test "toponym name must be smaller than 100 chars" do
    t = Toponym.new
    t.name= "GWBDUWV744DWbI1vZerUmTi6A3gnw9CBBzlPpB5HG2yXxN3GiYf7tqsJxZDeYSD4lRIRIfLMZX1abe0N00ZDWLfpFQ4mdH0nc8mEcsv"
    assert_not t.save
  end

  test "toponym name can not start and end with extra white spaces" do
    p = Toponym.new
    p.name ="   türkiye  --  ankara  --  nallıhan  "
    p.save
    assert_equal("türkiye -- ankara -- nallıhan", p.name)
  end

  test "toponym name must be bigger than 2 chars" do
    t = Toponym.new
    t.name= "de"
    assert_not t.save
  end

  test "toponym name must be unique" do
    t1= Toponym.new(name: "Paris")
    t1.save
    t2= Toponym.new(name: "Paris")
    assert_not t2.save
  end

  test "very long valid toponym" do
    t = Toponym.new
    t.name= %q(8vnnrHyIExJUNhMVj4kta5VEG3ncJn-tp1WvRJPGUPP1oxf11UlbLKXSlQVnOr77-R4uQwZ9VIHxUt5x1Gh72hc5ikV1lkRlzQ)
    assert t.save
  end

  test "Toponym name must be unique and case sensetive" do
    t1= Toponym.new(name: "Paris")
    t1.save
    t2= Toponym.new(name: "paris")
    assert_not t2.save
  end
end
