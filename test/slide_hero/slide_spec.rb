require 'minitest_helper'
module SlideHero
  describe Slide do
    describe "initialization" do
      it "is initialized with a title" do
        slide = Slide.new("Badgers learn knitting")
        slide.headline.must_equal "Badgers learn knitting"
      end

      it "can take an optional side directive" do
        slide = Slide.new("Badgers learn knitting", headline_size: :large)
        slide.headline_size.must_equal :large

        slide = Slide.new("Snacks lead to revolution in food care", headline_size: :medium)
        slide.headline_size.must_equal :medium
      end
    end

    describe "compilation" do
      it "outputs object to html" do
        slide = Slide.new("To Markup!")
        slide.compile.must_equal "<section><h1>To Markup!</h1></section>"
      end

      it "respects headline size" do
        slide = Slide.new("To Markup!", headline_size: :medium)
        slide.compile.must_equal "<section><h2>To Markup!</h2></section>"
      end
    end

    describe "block syntax" do
      it "embeds text in p tags by default" do
        slide = Slide.new "Embedding" do
          point "I'm embedded!"
        end

        slide.compile.must_equal "<section><h1>Embedding</h1><p>I'm embedded!</p></section>"
      end
    end
  end
end
