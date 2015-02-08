module SlideHero
  class GroupedSlides
    include Compilable
    def initialize(slide_defaults={}, &block)
      @slide_defaults = slide_defaults
      instance_eval(&block)
    end

    def slide(headline, **kwargs, &block)
      slides << Slide.new(headline, @slide_defaults.merge(**kwargs), &block).compile
    end

    def slides
      @slides ||= []
    end
  end
end
