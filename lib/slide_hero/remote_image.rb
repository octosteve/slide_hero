require "open-uri"
module SlideHero
  class RemoteImage
    attr_reader :location, :alt_text, :width, :height, :image_class, :as, :destination
    def initialize(location, alt_text="", image_class:Image, width:nil, height:nil, destination: 'images', as:nil)
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
      image_class.new(filename, alt_text, width: width, height:height).compile
    end

    private

    def file_cached?
      File.exist?("#{destination}/#{filename}")
    end

    def fetch_remote_file
      open(location) do |f|
        File.open("#{destination}/#{filename}","wb") do |file|
          file.puts f.read
        end
      end
    end

    def filename
      local_filename || remote_filename
    end

    def local_filename
      return nil unless as
      file_extention = URI.parse(location).path.split('.').last
      "#{as}.#{file_extention}"
    end

    def remote_filename
      URI.parse(location).path.split('/').last
    end
  end
end
