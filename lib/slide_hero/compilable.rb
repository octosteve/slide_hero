module SlideHero
  module Compilable
    def compile
      Tilt::ERBTemplate.new(
        File.join(SlideHero.template_path, template)).render(self).strip
    end

    def template
      template_file = underscore(self.class.name.split("::").last)
      "lib/slide_hero/views/#{template_file}.html.erb"
    end

    def underscore(camel_cased_word)
      return camel_cased_word unless camel_cased_word =~ /[A-Z-]|::/
      word = camel_cased_word.to_s.gsub(/::/, '/')
      word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      word.downcase!
      word
    end
  end
end
