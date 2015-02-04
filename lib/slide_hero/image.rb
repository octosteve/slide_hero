module SlideHero
  class Image
    attr_reader :location, :alt_text, :width, :height
    def initialize(location, alt_text="", width:nil, height:nil)
      @location = location
      @alt_text = alt_text
      @width = width
      @height = height
    end

    def compile
      %{<img#{width_attribute}#{height_attribute} class="stretch" src="images/#{location}" alt="#{alt_text}">}
    end

    def height_attribute
      %{ height="#{height}"} if height
    end

    def width_attribute
      %{ width="#{width}"} if width
    end
  end
end
