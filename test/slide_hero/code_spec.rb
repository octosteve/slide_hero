require 'minitest_helper'

module SlideHero
  describe Code do
    it "formats code properly" do
      code = Code.new(:ruby) do
        class Show
          attr_accessor :name
          def initialize(name)
            @name = name
          end
        end
      end
      
      code.compile.must_equal  '<pre><code>
        class Show
  attr_accessor(:name)
  def initialize(name)
    @name = name
  end
end
      </code></pre>'
   end

    it "rejects code that's not ruby" do
      proc { Code.new(:python) {} }.must_raise SystemExit
    end
  end
end
