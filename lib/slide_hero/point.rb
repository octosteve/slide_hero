module SlideHero
  class Point
    attr_reader :text
    SUPPORTED_ANIMATIONS = %w{grow shrink roll-in fade-out
      highlight-red highlight-green highlight-blue}

    def initialize(text, animation: nil)
      @text = text
      @animation = animation
    end

    def compile
      Tilt::ERBTemplate.new(
      File.join(SlideHero.template_path, template)).render(self).strip
    end

    def template
      template_file = SlideHero.underscore(self.class.to_s.split("::").last)
      "lib/slide_hero/views/#{template_file}.html.erb"
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
