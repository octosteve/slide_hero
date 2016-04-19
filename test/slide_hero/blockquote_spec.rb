require 'minitest_helper'
module SlideHero
  describe Blockquote do
    it "compiles to a beautiful blockquote" do
      quote = Blockquote.new(cite:"http://hostiledeveloper.com", quote: "You can't take a picture of a chess board from the top.")
      quote.compile.must_equal(<<-QUOTE.strip)
<blockquote cite="http://hostiledeveloper.com">
  You can't take a picture of a chess board from the top.
</blockquote>
      QUOTE
    end
  end
end
