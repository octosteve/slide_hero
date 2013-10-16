require_relative "slide_hero/version"
require_relative "slide_hero/slide"
require_relative "slide_hero/point"
require_relative "slide_hero/list"
require_relative "slide_hero/list_point"
require_relative "slide_hero/grouped_slides"
require_relative "slide_hero/code"
require_relative "slide_hero/presentation"
require_relative "slide_hero/dsl"

module SlideHero
  def self.get_binding
    binding
  end
end
