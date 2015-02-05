module SlideHero
  class Media
    attr_reader :url, :type
    def initialize(url, type: :video)
      @url = url
      @type = type
    end

    def compile
      Tilt::ERBTemplate.new(
      File.join(SlideHero.template_path, template)).render(self).strip
    end

    def template
      template_file = SlideHero.underscore(self.class.to_s.split("::").last)
      "lib/slide_hero/views/#{template_file}.html.erb"
    end

  end
end
