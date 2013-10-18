module SlideHero
  class Note
    attr_reader :text
    def initialize(text)
      @text = text
    end

    def compile
      %{<aside class="notes">#{text}</aside>}
    end
  end
end
