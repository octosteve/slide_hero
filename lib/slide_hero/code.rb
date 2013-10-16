module SlideHero
  class Code
    def initialize(language, &code_file)
      @language = language
      @source = File.read("#{Dir.pwd}/#{code_file.call}")
    end

    def compile
      Tilt::ERBTemplate.
        new(File.join(Gem.loaded_specs['slide_hero'].full_gem_path, 
                      'lib/slide_hero/views/code.html.erb')).render(self)
    end
  end
end
