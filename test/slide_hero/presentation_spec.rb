require 'minitest_helper'

module SlideHero
  describe Presentation do
    it "takes a title" do
      pres = Presentation.new("Grow gills in 8 days") do
      end
      pres.title.must_equal "Grow gills in 8 days"
      pres.compile.must_include "<title>Grow gills in 8 days</title>"
    end

    it "compiles to an empty entire presentation" do
      pres = Presentation.new("My Pres") {}
      pres.compile.must_include "<div class=\"slides\">"
    end

    it "takes slides" do
      pres = Presentation.new("slides") do
        slide "My slide" do
          point "Bananas are tastey"
        end
      end
      pres.slides.count.must_equal 1
    end

    it "takes grouped_slides" do
      pres = Presentation.new("slides") do
        grouped_slides do
          slide "My slide" do
            point "Bananas are tastey"
          end
        end
      end
      pres.slides.count.must_equal 1
    end

    it "nests slides in presentation" do
      pres = Presentation.new("New stuff") do
        slide "Nesting!" do
          point "Woot!"
        end
      end

      assert_dom_includes("<section data-transition=\"default\"><h1>Nesting!</h1><p>Woot!</p></section>", pres.compile)
    end
  end
end
