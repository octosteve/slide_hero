require 'minitest_helper'

module SlideHero
  describe Code do
    it "takes an optional base path of where to look for files" do
      code = Code.new(:ruby, File.join(Dir.pwd,"test","fixtures")) do
        "testclass.rb"
      end
      code.location.must_equal(File.join(Dir.pwd,"test","fixtures","code", "testclass.rb"))
    end
    it "exposes language from initialization value" do
      code = Code.new(:ruby, File.join(Dir.pwd,"test","fixtures")) do
        "testclass.rb"
      end
      code.language.must_equal :ruby
    end

    it "exposes source from initialization value" do
      code = Code.new(:ruby, File.join(Dir.pwd,"test","fixtures")) do
        "testclass.rb"
      end
      code.source.must_include "class Working" 
    end

    it "formats code properly" do
      code = Code.new(:ruby, File.join(Dir.pwd,"test","fixtures")) do
        "testclass.rb"
      end

      code.compile.strip.must_equal  '<pre><code data-trim class="ruby">
  class Working
  def some_method
    "woot!"
  end
end

</code></pre>'
    end

    it "exits if file is not found" do

      lambda do
        code = Code.new(:ruby) do
          "dont_exists.rb"
        end
      end.must_raise SystemExit
    end

  end
end
