module SlideHero
  class Slide
    include Compilable
    extend Pluggable

    attr_reader :headline, :headline_size, :transition, :background
    def initialize(headline=nil, headline_size: :medium, transition: :default, background: nil, &point_block)
      @headline = headline
      @headline_size = headline_size
      @transition = transition

      @background= background
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
        case 
        when String(background).start_with?('http')
          attr << " data-background=\"#{background}\""
        when String(background).include?('.')
          filename = background.gsub(/\s/, "%20")
          attr << " data-background=\"/images/#{filename}\""
        when background
          attr << " data-background=\"#{background}\""
        end
      end
    end
  end
end
