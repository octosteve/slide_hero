require 'minitest_helper'

module SlideHero
  describe DSL do
    include SlideHero::DSL
    it "creates a presentation object at root object" do
      pres = presentation "I like turtles" do
        slide "Turtles are cool" do
          point "Not as cool as fezzes"
        end
      end
      pres.must_include "Turtles are cool"
    end

    it "passes code properly" do
      pres = presentation "Code" do
        slide "Code test" do
          code(:ruby) do
            "test/fixtures/testclass.rb"
          end
        end
      end

      pres.must_include "class Working"
    end
    it "handles defaults properly" do
      pres = presentation "Defaults" do
        defaults headline_size: :medium
        slide "Outer Slide"
        grouped_slides do
          slide "Inner Slide"
        end
      end
      pres.must_include "<h2>Outer Slide</h2>"
      pres.must_include "<h2>Inner Slide</h2>"
    end
  end
end
