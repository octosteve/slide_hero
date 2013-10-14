module SlideHero
  require 'sourcify'
  class Code
    def initialize(language, &code)
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
