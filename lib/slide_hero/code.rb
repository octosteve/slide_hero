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
      "<pre><code>
        #{@source}
      </code></pre>"
    end
  end
end
