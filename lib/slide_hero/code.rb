module SlideHero
  class Code
    include Compilable
    attr_reader :language, :source, :location
    def initialize(language, code_path=Dir.pwd, &code_file)
      @language = language
      @location = "#{code_path}/code/#{code_file.call}"
      @source = File.read(location)
    rescue Errno::ENOENT
      abort "#{Dir.pwd}/#{code_file.call} not found"
    end
  end
end
