module SlideHero
  class Media
    attr_reader :url, :type
    def initialize(url, type: :video)
      @url = url
      @type = type
    end

    def compile
      %{<#{type} data-autoplay src="#{url}"></#{type}>}
    end
  end
end
