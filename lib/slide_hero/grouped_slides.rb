module SlideHero
  class GroupedSlides
    def initialize(&block)
      instance_eval(&block)
    end

    def compile
      Tilt::ERBTemplate.
        new(File.join(Gem.loaded_specs['slide_hero'].full_gem_path, 
                      'lib/slide_hero/views/grouped_slides.html.erb')).render(self)
    end

    def slide(headline, **kwargs, &block)
      slides << Slide.new(headline, **kwargs, &block).compile
    end

    def slides
      @slides ||= []
    end
  end
end
