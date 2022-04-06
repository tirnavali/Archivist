require "test_helper"

class PhisycalStatusTest < ActiveSupport::TestCase
  test "valid phisycal status" do
    assert_difference 'PhisycalStatus.count' do
      PhisycalStatus.create! name: "Yıpranmış2"
    end
  end

  test "phisycal status name can not empty" do
    p = PhisycalStatus.new
    p.name= ""
    assert_not p.save
  end

  test "name can not start and end with extra white spaces" do
    p = PhisycalStatus.new
    p.name ="   Yıpranmış ve   Eski  "
    p.save
    assert_equal("Yıpranmış ve Eski", p.name)
  end

  test "phisycal status name cannot be bigger than 20 chars" do
    t = PhisycalStatus.new
    t.name= "GWBDUWV744DWbI1vZerUmTi6A3gnw9CBBzlPpB5HG2yXxN3GiYf7tqsJxZDeYSD4lRIRIfLMZX1abe0N00ZDWLfpFQ4mdH0nc8mEcsv"
    assert_not t.save
  end

  test "phisycal status name can be equal 20 chars" do
    t = PhisycalStatus.new
    t.name= "genjGH1STRwyhMBGVAWD"
    assert t.save
  end

  test "phisycal status cannot be smaller than 3 chars" do
    t = PhisycalStatus.new
    t.name= "de"
    assert_not t.save
  end

  test "phisycal status name must be unique" do
    t1= PhisycalStatus.new(name: "Çok gizli")
    t1.save
    t2= PhisycalStatus.new(name: "Çok gizli")
    assert_not t2.save
  end

  test "phisycal status name must be unique and case sensetive" do
    t1= PhisycalStatus.new(name: "Kamusal Gizli")
    t1.save
    t2= PhisycalStatus.new(name: "kamusal gizli")
    assert_not t2.save
  end
end
