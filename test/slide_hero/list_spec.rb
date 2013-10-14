require 'minitest_helper'

describe List do
  it "takes a block of items to list" do
    list = List.new do 
      point "A thing"
      point "another"
    end

    list.compile.must_equal '<ul><li>A thing</li><li>another</li></ul>'
  end
end
