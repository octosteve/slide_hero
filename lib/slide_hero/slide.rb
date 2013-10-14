module SlideHero
  class Slide
    attr_reader :headline, :headline_size, :transition
    def initialize(headline, headline_size: :large, transition: :default, &point_block)
      @headline = headline
      @headline_size = headline_size
      @transition = transition
      instance_eval(&point_block) if block_given?
    end

    def compile
      "<section #{data_attributes}>" +
        "<#{size_to_markup}>#{headline}</#{size_to_markup}>" +
      "#{collected_points}" +
        "</section>"
    end

    def point(text)
      points << Point.new(text).compile
    end

    def list(style=:unordered, &block)
      points << List.new(style, &block).compile
    end

    def code(language, &code)
      points << Code.new(language, &code).compile
    end

    def collected_points
      points.inject(:+)
    end

    def points
      @points ||= []
    end

    private
    def size_to_markup
      { 
        large: :h1,
        medium: :h2,
        small: :h3
      }[headline_size]
    end

    def data_attributes
      "data-transition=\"#{transition}\""
    end
  end
end
