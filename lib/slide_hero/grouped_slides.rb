module SlideHero
  class GroupedSlides
    def initialize(&block)
      instance_eval(&block)
    end

    def compile
      "<section>#{slides.inject(:+)}</section>"
    end

    def slide(headline, &block)
      slides << Slide.new(headline, &block).compile
    end

    def slides
      @slides ||= []
    end
  end
end
