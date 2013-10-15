require 'minitest_helper'

module SlideHero
  describe ListPoint do
    it "takes text and an animation on initialization" do
      line_point = ListPoint.new("point!", animation: nil)
      line_point.text.must_equal "point!"
      line_point.animation.must_equal nil
    end
  end
end
