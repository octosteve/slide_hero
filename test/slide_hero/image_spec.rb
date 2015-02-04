require 'minitest_helper'

module SlideHero
  describe Image do
    it "takes an image path and renders appropriate markup" do
      image = Image.new("cornify.gif", "Unicorn", width: 280, height: 326)
      image.compile.must_equal %{<img width="280" height="326" class="stretch" src="images/cornify.gif" alt="Unicorn">}
    end

    it "doesn't require all fields" do
      image = Image.new("cornify.gif")
      image.compile.must_equal %{<img class="stretch" src="images/cornify.gif" alt="">}
    end
  end
end
