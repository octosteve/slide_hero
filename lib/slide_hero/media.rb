module SlideHero
  class Media
    include Compilable
    attr_reader :url, :type
    def initialize(url, type: :video)
      @url = url
      @type = type
    end
  end
end
