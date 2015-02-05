require_relative "slide_hero/version"
require_relative "slide_hero/plugins"
require_relative "slide_hero/slide"
require_relative "slide_hero/point"
require_relative "slide_hero/list"
require_relative "slide_hero/list_point"
require_relative "slide_hero/grouped_slides"
require_relative "slide_hero/code"
require_relative "slide_hero/presentation"
require_relative "slide_hero/note"
require_relative "slide_hero/image"
require_relative "slide_hero/remote_image"
require_relative "slide_hero/media"
require_relative "slide_hero/dsl"

module SlideHero
  def self.get_binding
    binding
  end

  def self.template_path
      gem = Gem.loaded_specs['slide_hero']
      if gem
        gem.full_gem_path
      else
        '.'
      end
  end

  def self.underscore(camel_cased_word)
    return camel_cased_word unless camel_cased_word =~ /[A-Z-]|::/
    word = camel_cased_word.to_s.gsub(/::/, '/')
    word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.downcase!
    word
  end
end
