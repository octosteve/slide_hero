module SlideHero
  class Code
    attr_reader :language, :source, :location
    def initialize(language, code_path=Dir.pwd, &code_file)
      @language = language
      @location = "#{code_path}/code/#{code_file.call}"
      @source = File.read(location)
    rescue Errno::ENOENT 
      abort "#{Dir.pwd}/#{code_file.call} not found"
    end

    def compile
      Tilt::ERBTemplate.
        new(File.join(SlideHero.template_path,
                      'lib/slide_hero/views/code.html.erb')).render(self)
    end
  end
end
