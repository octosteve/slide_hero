module SlideHero
  class Slide
    include Compilable
    extend Pluggable

    attr_reader :headline, :headline_size, :transition, :background_color
    def initialize(headline=nil, headline_size: :medium, transition: :default, background_color: nil, &point_block)
      @headline = headline
      @headline_size = headline_size
      @transition = transition

      @background_color = background_color
      instance_eval(&point_block) if block_given?
    end

    create_plugs_for Note, Point, List, Code, Image, RemoteImage, Media

    def points
      @points ||= []
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
