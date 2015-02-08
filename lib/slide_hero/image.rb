module SlideHero
  class Image
    include Compilable
    attr_reader :location, :alt_text, :width, :height
    def initialize(location, alt_text="", width:nil, height:nil)
      @location = location
      @alt_text = alt_text
      @width = width
      @height = height
    end

    def height_attribute
      %{ height="#{height}"} if height
    end

    def width_attribute
      %{ width="#{width}"} if width
    end
  end
end
