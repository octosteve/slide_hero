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
      
      code.compiled.must_equal  '<pre><code>
        class Show
  attr_accessor(:name)
  
  def initialize(name)
    @name = name
  end
end
      </code></pre>'
   end
  end
end
