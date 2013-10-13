module SlideHero
  class Slide
    attr_reader :headline, :headline_size
    def initialize(headline, headline_size: :large)
      @headline = headline
      @headline_size = headline_size
    end

    def compile
      "<section><h1>#{headline}</h1></section>"
    end
  end
end
