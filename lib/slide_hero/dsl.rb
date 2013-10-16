module SlideHero
  module DSL
    def presentation(title, &slide_block)
      SlideHero::Presentation.new(title, &slide_block).compile
    end
  end
end

extend SlideHero::DSL
Module.send(:include, SlideHero::DSL)
