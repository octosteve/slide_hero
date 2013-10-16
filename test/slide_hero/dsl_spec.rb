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
  end
end
