module SlideHero
  class ListPoint
    include Compilable
    alias_method :to_s, :compile
    attr_reader :animation, :text
    SUPPORTED_ANIMATIONS = %w{grow shrink roll-in fade-out
      highlight-red highlight-green highlight-blue}

    def initialize(text, options={})
      @text = text
      @animation = options[:animation]
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
