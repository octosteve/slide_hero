require 'minitest_helper'
require 'webmock/minitest'
require 'fileutils'

module SlideHero
  describe Image do

    describe "using the `as` parameter" do
      after do
        image = File.join(Dir.pwd,"test","tmp","images", "le_troll.png")
        File.delete(image)
      end

      it "downloads remote file, and serves it locally" do
        stub_request(:get, "http://example.com/troll.png").
        to_return(body: File.open(File.join(Dir.pwd,"test","fixtures","images", "image.png")))

        destination_folder = File.join(Dir.pwd,"test","tmp","images")
        image = RemoteImage.new("http://example.com/troll.png", "Troll", width: 280, height: 326, as: "le_troll", destination: destination_folder)
        image.compile.must_equal %{<img width="280" height="326" class="stretch" src="images/le_troll.png" alt="Troll">}
        assert_requested :get, "http://example.com/troll.png"
      end

      it "does not make web request if image is in destination folder" do
        destination_folder = File.join(Dir.pwd,"test","tmp","images")
        FileUtils.touch("#{destination_folder}/le_troll.png")

        stub_request(:get, "http://example.com/troll.png")

        image = RemoteImage.new("http://example.com/troll.png", "Troll", width: 280, height: 326, as: "le_troll", destination: destination_folder)
        image.compile.must_equal %{<img width="280" height="326" class="stretch" src="images/le_troll.png" alt="Troll">}
        assert_not_requested :get, "http://example.com/troll.png"
      end
    end


    describe "not providing filename" do
      after do
        image = File.join(Dir.pwd,"test","tmp","images", "troll.png")
        File.delete(image)
      end
      it "uses filename from url if not provided" do
        stub_request(:get, "http://example.com/troll.png").
        to_return(body: File.open(File.join(Dir.pwd,"test","fixtures","images", "image.png")))

        destination_folder = File.join(Dir.pwd,"test","tmp","images")
        image = RemoteImage.new("http://example.com/troll.png", "Troll", width: 280, height: 326, destination: destination_folder)
        image.compile.must_equal %{<img width="280" height="326" class="stretch" src="images/troll.png" alt="Troll">}
      end
    end
  end
end
