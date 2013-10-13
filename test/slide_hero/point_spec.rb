require 'minitest_helper'
module SlideHero
  describe Point do
    it "wraps it's text in p tags" do
      point = Point.new("I'm a tiger")
      point.compile.must_equal "<p>I'm a tiger</p>"
    end
  end
end
