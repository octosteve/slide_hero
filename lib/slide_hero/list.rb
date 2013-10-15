module SlideHero
  class List
    attr_reader :style
    SUPPORTED_ANIMATIONS = %w{grow shrink roll-in fade-out 
      highlight-red highlight-green highlight-blue}

    def initialize(style=:unordered, &block)
      @style = style 
      instance_eval(&block)
    end

    def compile
      "<#{style_to_markup}>" +
        @points.join +
        "</#{style_to_markup}>"
    end

    def point(text, animation: nil)
      @animation = animation
      points << "<li#{animation_class}>#{text}</li>"
    end

    def points
      @points ||= []
    end

    def style_to_markup
      { unordered: :ul,
        ordered: :ol}[style] || :ul
    end

    private
    def animation_class
      if @animation
        animation_markup = ' class="fragment ' 
        if SUPPORTED_ANIMATIONS.include? @animation
          animation_markup << @animation 
        end
        animation_markup + "\""
      end
    end
  end
end
