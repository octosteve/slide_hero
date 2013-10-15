module SlideHero
  class GroupedSlides
    def initialize(&block)
      instance_eval(&block)
    end

    def compile
      Tilt::ERBTemplate.new('lib/slide_hero/views/grouped_slides.html.erb').render(self)
    end

    def slide(headline, &block)
      slides << Slide.new(headline, &block).compile
    end

    def slides
      @slides ||= []
    end
  end
end
