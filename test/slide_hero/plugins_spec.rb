require 'minitest_helper'

module SlideHero
  describe Plugins do
    it "contains configuration values for reveal plugins" do
        Plugins.reveal[:class_list].must_equal  "{ src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } }"
        Plugins.reveal[:markdown].must_equal  "{ src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },{ src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } }"
        Plugins.reveal[:highlight].must_equal  "{ src: 'plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } }"
        Plugins.reveal[:zoom].must_equal  "{ src: 'plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } }"
        Plugins.reveal[:notes].must_equal  "{ src: 'plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } }"
        Plugins.reveal[:remote].must_equal  "{ src: 'plugin/remotes/remotes.js', async: true, condition: function() { return !!document.body.classList; } }"
        Plugins.reveal[:leap].must_equal "{ src: 'plugin/leap/leap.js', async: true }"
    end
  end
end
