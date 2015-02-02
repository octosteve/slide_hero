module SlideHero
  require 'erb'
  require 'tilt'
  class Presentation
    attr_reader :title, :slide_defaults
    def initialize(title, &block)
      @title = title
      @slide_defaults = {}
      instance_eval(&block)
    end

    def set_plugins(*plugin_list)
      if plugin_list.empty?
        defaults = %i{class_list highlight notes remote}
        plugin_list = defaults
      end

      plugin_list.each do |plugin|
        if Plugins.reveal_list.include? plugin
          plugins <<  "#{Plugins.reveal[plugin]},"
        end
      end

      plugins.chop
    end

    def plugins
      @plugins ||= ""
    end

    def compile
      set_plugins if plugins.empty?
      Tilt::ERBTemplate.new(File.join(SlideHero.template_path, 
                                      'lib/slide_hero/views/layout.html.erb')).
                                      render(self) do 
                                        collected_slides
                                      end
    end

    def defaults(args)
      @slide_defaults = args
    end

    def theme
      @theme ||= 'solarized'
    end

    def set_theme(theme)
      @theme = theme
    end

    def slide(title, **kwargs, &slide_block)
      slides << Slide.new(title, slide_defaults.merge(**kwargs), &slide_block).compile
    end

    def grouped_slides(&block)
      slides << GroupedSlides.new(slide_defaults, &block).compile
    end

    def collected_slides
      slides.join
    end

    def slides
      @slides ||= []
    end
  end
end
