require 'minitest_helper'

module SlideHero
  describe Media do
    describe "initialization" do
      it "is initialized with a url" do
        media = Media.new("http://www.youtube.com/watch?v=dQw4w9WgXcQ", type: :video)
        media.url.must_equal "http://www.youtube.com/watch?v=dQw4w9WgXcQ"
        media.type.must_equal :video
      end
    end

    describe "video type" do
      it "compiles to html fragment" do
        media = Media.new("http://www.youtube.com/watch?v=dQw4w9WgXcQ", type: :video)
        media.compile.must_equal %{<video data-autoplay src="http://www.youtube.com/watch?v=dQw4w9WgXcQ"></video>}
      end
    end

    describe "audio type" do
      it "compiles to html fragment" do
        media = Media.new("http://www.example.com/audio.mp3", type: :audio)
        media.compile.must_equal %{<audio data-autoplay src="http://www.example.com/audio.mp3"></audio>}
      end
    end
  end
end
