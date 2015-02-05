module SlideHero
  class Slide
    attr_reader :headline, :headline_size, :transition, :background_color
    def initialize(headline=nil, headline_size: :medium, transition: :default, background_color: nil, &point_block)
      @headline = headline
      @headline_size = headline_size
      @transition = transition

      @background_color = background_color
      instance_eval(&point_block) if block_given?
    end

    def compile
      Tilt::ERBTemplate.new(
      File.join(SlideHero.template_path, template)).render(self).strip
    end

    def template
      template_file = SlideHero.underscore(self.class.to_s.split("::").last)
      "lib/slide_hero/views/#{template_file}.html.erb"
    end

    def point(text, animation: nil)
      points << Point.new(text, animation: animation).compile
    end

    def list(style=:unordered, &block)
      points << List.new(style, &block).compile
    end

    def code(*args, &code)
      points << Code.new(*args, &code).compile
    end

    def points
      @points ||= []
    end

    def note(text)
      points << Note.new(text).compile
    end

    def image(*args, **kwargs)
      points << Image.new(*args, **kwargs).compile
    end

    def remote_image(*args, **kwargs)
      points << RemoteImage.new(*args, **kwargs).compile
    end

    def media(*args, **kwargs)
      points << Media.new(*args, **kwargs).compile
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
      "data-transition=\"#{transition}\"".tap do |attr|
        if background_color
          attr << " data-background=\"#{background_color}\""
        end
      end
    end
  end
end
