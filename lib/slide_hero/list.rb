module SlideHero
  class List
    attr_reader :style

    def initialize(style=:unordered, &block)
      @style = style 
      instance_eval(&block)
    end

    def compile
      if style == :unordered
        Tilt::ERBTemplate.new(File.join(SlideHero.template_path, 
                                        'lib/slide_hero/views/unordered_list.html.erb')).render(self).strip
      else
        Tilt::ERBTemplate.new(File.join(SlideHero.template_path, 
                                        'lib/slide_hero/views/ordered_list.html.erb')).render(self).strip
      end
    end

    def point(text, animation: nil)
      points << ListPoint.new(text, { animation: animation })
    end

    def list(style=:unordered, &block)
      points << List.new(style, &block).compile
    end

    def points
      @points ||= []
    end
  end
end
