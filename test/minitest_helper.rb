$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'slide_hero'

require 'minitest/autorun'
require 'minitest/spec'
def assert_dom_match(expected, actual)
  dom_clean(actual).must_equal(
    dom_clean(expected))
end

def assert_dom_includes(expected, actual)
  dom_clean(actual).must_include(
    dom_clean(expected))
end

def dom_clean(html)
  html.gsub!(/>\s*</, '><').strip
end
