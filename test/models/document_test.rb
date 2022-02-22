require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save document without summary" do
    doc = Document.new
    assert_not doc.save
  end
end
