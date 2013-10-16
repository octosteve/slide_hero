require 'minitest_helper'

module SlideHero
  describe Code do
    it "formats code properly" do
      code = Code.new(:ruby) do
        "test/fixtures/testclass.rb"
      end

      code.compile.strip.must_equal  '<pre><code data-trim>
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
