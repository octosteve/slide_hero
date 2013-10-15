module SlideHero
  require 'erb'
  require 'tilt'
  class Presentation
    attr_reader :title
    def initialize(title, &block)
      @title = title
      instance_eval(&block)
    end

    def compile
      Tilt::ERBTemplate.new('lib/slide_hero/views/layout.html.erb').render(self) do 
        collected_slides
      end
    end

    def slide(title, &slide_block)
      slides << Slide.new(title, &slide_block).compile
    end

    def grouped_slides(&block)
      slides << GroupedSlides.new(&block).compile
    end

    def collected_slides
      slides.inject(:+)
    end

    def slides
      @slides ||= []
    end
  end
end
