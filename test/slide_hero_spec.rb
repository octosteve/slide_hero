require 'minitest_helper'
require_relative 'slide_hero/slide_spec'
require_relative 'slide_hero/point_spec'
require_relative 'slide_hero/list_spec'
require_relative 'slide_hero/list_point_spec'
require_relative 'slide_hero/grouped_slides_spec'
require_relative 'slide_hero/code_spec'
require_relative 'slide_hero/presentation_spec'
require_relative 'slide_hero/dsl_spec'
require_relative 'slide_hero/note_spec'
require_relative 'slide_hero/image_spec'
require_relative 'slide_hero/media_spec'
require_relative 'slide_hero/plugins_spec'

describe ::SlideHero do
  it "has a version" do
    ::SlideHero::VERSION.wont_be_nil
  end
end
