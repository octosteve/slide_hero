require 'minitest_helper'

module SlideHero
  describe Note do
    it "Properly wraps notes" do
      note = Note.new("Remind them of this")
      assert_equal(note.compile, "<aside class=\"notes\">Remind them of this</aside>")
    end
  end
end
