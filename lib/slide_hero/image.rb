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
      Tilt::ERBTemplate.new(
      File.join(SlideHero.template_path, template)).render(self).strip
    end

    def template
      template_file = SlideHero.underscore(self.class.to_s.split("::").last)
      "lib/slide_hero/views/#{template_file}.html.erb"
    end


    def height_attribute
      %{ height="#{height}"} if height
    end

    def width_attribute
      %{ width="#{width}"} if width
    end
  end
end
