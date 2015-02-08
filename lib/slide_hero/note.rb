module SlideHero
  class Note
    include Compilable
    attr_reader :text
    def initialize(text)
      @text = text
    end
  end
end
