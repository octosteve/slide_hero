module SlideHero
  class ListPoint
    attr_reader :animation, :text
    SUPPORTED_ANIMATIONS = %w{grow shrink roll-in fade-out 
      highlight-red highlight-green highlight-blue}

    def initialize(text, options={})
      @text = text
      @animation = options[:animation]
    end

    def to_s
      "<li#{animation_class}>#{text}</li>"
    end

    def animation_class
      if animation
        animation_markup = ' class="fragment ' 
        if SUPPORTED_ANIMATIONS.include? animation
          animation_markup << animation 
        end
        animation_markup + "\""
      end
    end
  end
end
