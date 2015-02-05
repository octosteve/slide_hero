module SlideHero
  class GroupedSlides
    def initialize(slide_defaults={}, &block)
      @slide_defaults = slide_defaults
      instance_eval(&block)
    end

    def compile
      Tilt::ERBTemplate.new(
      File.join(SlideHero.template_path, template)).render(self).strip
    end

    def template
      template_file = SlideHero.underscore(self.class.to_s.split("::").last)
      "lib/slide_hero/views/#{template_file}.html.erb"
    end

    def slide(headline, **kwargs, &block)
      slides << Slide.new(headline, @slide_defaults.merge(**kwargs), &block).compile
    end

    def slides
      @slides ||= []
    end
  end
end
