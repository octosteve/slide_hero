module SlideHero
  require 'erb'
  require 'tilt'
  class Presentation
    attr_reader :title
    def initialize(title, &block)
      @title = title
      @slide_defaults = {}
      instance_eval(&block)
    end

    def compile
      gem_path = Gem.loaded_specs['slide_hero'].full_gem_path
      Tilt::ERBTemplate.new(File.join(gem_path, 
                                      'lib/slide_hero/views/layout.html.erb')).
                                      render(self) do 
        collected_slides
      end
    end

    def defaults(args)
      @slide_defaults = args
    end

    def slide(title, **kwargs, &slide_block)
      slides << Slide.new(title, @slide_defaults.merge(**kwargs), &slide_block).compile
    end

    def grouped_slides(&block)
      slides << GroupedSlides.new(@slide_defaults, &block).compile
    end

    def collected_slides
      slides.join
    end

    def slides
      @slides ||= []
    end
  end
end
