module SlideHero
  module Plugins
    def self.reveal
      {
        class_list:  "{ src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } }",
        markdown:  "{ src: 'plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
                  { src: 'plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } }",
        highlight:  "{ src: 'plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } }",
        zoom:  "{ src: 'plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } }",
        notes:  "{ src: 'plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } }",
        leap: "{ src: 'plugin/leap/leap.js', async: true }"
      }
    end

    def self.reveal_list
      reveal.keys
    end
  end
end
