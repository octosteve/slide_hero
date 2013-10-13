module SlideHero
  class Slide
    attr_reader :headline, :headline_size
    def initialize(headline, headline_size: :large, &point_block)
      @headline = headline
      @headline_size = headline_size
      instance_eval(&point_block) if block_given?
    end

    def compile
      if @point
        "<section><#{size_to_markup}>#{headline}</#{size_to_markup}><p>#{@point}</p></section>"
      else
        "<section><#{size_to_markup}>#{headline}</#{size_to_markup}></section>"
      end
    end

    def point(text)
      @point = text
    end

    private
    def size_to_markup
      { 
        large: :h1,
        medium: :h2,
        small: :h3
      }[headline_size]

    end
  end
end
