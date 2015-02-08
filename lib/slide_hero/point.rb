module SlideHero
  class Point
    include Compilable
    attr_reader :text
    SUPPORTED_ANIMATIONS = %w{grow shrink roll-in fade-out
      highlight-red highlight-green highlight-blue}

    def initialize(text, animation: nil)
      @text = text
      @animation = animation
    end

    private
    def animation
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
