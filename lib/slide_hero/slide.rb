module SlideHero
  class Slide
    attr_reader :headline, :headline_size, :transition
    def initialize(headline, headline_size: :large, transition: :default, &point_block)
      @headline = headline
      @headline_size = headline_size
      @transition = transition
      instance_eval(&point_block) if block_given?
    end

    def compile
      Tilt::ERBTemplate.new(File.join(SlideHero.template_path, 
                                      'lib/slide_hero/views/slide.html.erb')).
                                      render(self)
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
      "data-transition=\"#{transition}\""
    end
  end
end
