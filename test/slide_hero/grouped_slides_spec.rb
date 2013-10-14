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

        grouped_slides.compile.must_equal "<section>" +
          "<section data-transition=\"default\">" +
          "<h1>banana</h1>" +
          "<p>High in potassium</p>" +
          "</section>" +
          "<section data-transition=\"default\">" +
          "<h1>apple</h1>" +
          "<p>Good if you hate doctors</p>" +
          "</section>" +
          "</section>" 
      end
    end
  end
end
