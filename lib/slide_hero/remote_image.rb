require "open-uri"
module SlideHero
  class RemoteImage
    attr_reader :location, :alt_text, :width, :height, :image_class, :as, :destination
    def initialize(location, alt_text="", image_class:Image, width:nil, height:nil, destination: 'images', as:)
      @location = location
      @alt_text = alt_text
      @width = width
      @height = height
      @image_class = image_class
      @destination = destination
      @as = as
    end

    def compile
      fetch_remote_file unless file_cached?
      image_class.new(local_name, alt_text, width: width, height:height).compile
    end

    private

    def file_cached?
      File.exist?("#{destination}/#{local_name}")
    end

    def fetch_remote_file
      open(location) do |f|
        File.open("#{destination}/#{local_name}","wb") do |file|
          file.puts f.read
        end
      end
    end

    def local_name
      file_extention = location.match(/.*(.\w\w\w\w?)/)[1]
      as + file_extention
    end
  end
end
