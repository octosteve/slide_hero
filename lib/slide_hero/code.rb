module SlideHero
  require 'sourcify'
  class Code
    SUPPORTED_LANGUAGES = [:ruby]
    def initialize(language, &code)
      unless SUPPORTED_LANGUAGES.include? language
        abort "Unsupported language: #{language}" 
      end
      @language = language
      @source = code.to_source(:strip_enclosure => true)
    end

    def compile
      Tilt::ERBTemplate.
        new(File.join(Gem.loaded_specs['slide_hero'].full_gem_path, 
                      'lib/slide_hero/views/code.html.erb')).render(self)
    end
  end
end
