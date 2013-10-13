module SlideHero
  class Point
    attr_reader :text
    def initialize(text)
      @text = text
    end

    def compile
      "<p>#{text}</p>"
    end
  end
end
