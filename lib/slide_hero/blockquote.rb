module SlideHero
  class Blockquote
    attr_reader :cite, :quote
    include Compilable
    def initialize(cite:nil, quote:"")
      @cite = cite
      @quote = quote
    end
  end
end
