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

    describe "#point syntax" do
      it "embeds text in p tags by default" do
        slide = Slide.new "Embedding" do
          point "I'm embedded!"
        end

        slide.compile.must_equal "<section><h1>Embedding</h1><p>I'm embedded!</p></section>"
      end

      it "embeds raw html" do
        slide = Slide.new "Embedding" do
          point "<small>I'm embedded!</small>"
        end

        slide.compile.must_equal "<section><h1>Embedding</h1><p><small>I'm embedded!</small></p></section>"
      end

      it "embeds multiple points" do
        slide = Slide.new "Embedding" do
          point "I'm embedded!"
          point "Me too!"
        end

        slide.compile.must_equal "<section><h1>Embedding</h1><p>I'm embedded!</p><p>Me too!</p></section>"
      end
    end

    describe "#list" do
      it "creates bullets from a block" do
        slide = Slide.new "Lists" do
          list do
            point "Bullet Points"
            point "Another Point"
          end
        end
        slide.compile.must_equal "<section><h1>Lists</h1><ul><li>Bullet Points</li><li>Another Point</li></ul></section>"
      end
    end
  end
end
