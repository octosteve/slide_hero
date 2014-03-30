require 'minitest_helper'

module SlideHero
  describe GroupedSlides do
    describe "nesting slides" do
      it "groups sections" do
        grouped_slides = GroupedSlides.new do
          slide "banana" do
            point "High in potassium"
          end
          slide "apple" do
            point "Good if you hate doctors"
          end
        end

        assert_dom_match grouped_slides.compile, "<section>" +
          "<section data-transition=\"default\">" +
          "<h2>banana</h2>" +
          "<p>High in potassium</p>" +
          "</section>" +
          "<section data-transition=\"default\">" +
          "<h2>apple</h2>" +
          "<p>Good if you hate doctors</p>" +
          "</section>" +
          "</section>" 
      end

      it "takes all arguments slide handles" do
        grouped_slides = GroupedSlides.new do
          slide "Title", headline_size: :medium, transition: :zoom do
            point "Made one"
          end
        end

        grouped_slides.compile.must_include "transition"
        grouped_slides.compile.must_include "h2"
      end
    end

    it "can have defaults passed in" do
      grouped_slides = GroupedSlides.new(headline_size: :medium) do
        slide "Title" 
      end
      grouped_slides.compile.must_include "<h2>Title</h2>"
    end
  end
end
