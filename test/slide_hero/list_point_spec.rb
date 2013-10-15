require 'minitest_helper'

module SlideHero
  describe ListPoint do
    it "takes text and an animation on initialization" do
      list_point = ListPoint.new("point!", animation: nil)
      list_point.text.must_equal "point!"
      list_point.animation.must_equal nil
      list_point.animation_class.must_equal nil
    end

    describe "#animation_class" do
      it "applies fragement if animation is true" do
        list_point = ListPoint.new("foo", animation: true)
        list_point.animation_class.must_equal " class=\"fragment \""
      end

      it "only applies simple animation if value not supported" do
        list_point = ListPoint.new("foo", animation: "banana")
        list_point.animation_class.must_equal " class=\"fragment \""
      end

      it "applies extra classes for supported animations" do
        supported_animations = %w{grow shrink roll-in fade-out 
      highlight-red highlight-green highlight-blue}

        supported_animations.each do |animation|
          list_point = ListPoint.new("foo", animation: animation)
          list_point.animation_class.must_equal " class=\"fragment #{animation}\""
        end
      end
    end
  end
end
