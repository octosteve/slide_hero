# SlideHero

SlideHero is a gem for creating presentations backed by reveal.js through a 
Ruby DSL. 

## Installation

Requires Ruby 2.1

Add this line to your application's Gemfile:

```ruby
gem 'slide_hero'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slide_hero

## Usage
All features are accessible through the `slidehero` command.

### Generator

    slidehero new presentation_name
    
This creates a new folder named `presentation_name` in the current directory. Inside, there is a sample file called `presentation.rb`. 

### Server

    slidehero serve
 
Call this in the same folder as your presentation to serve your files on port 9292. You can optionally pass in an alternate location for the presentation.rb file.

    slidehero serve ../other/folder/presentation.rb
    
### Compilation

    slidehero compile
  
Use this if you just want a folder with the markup files. A new `presentation` folder is created.

### DSL

The DSL for SlideHero was created to add expressibility to creating slides.

**presentation**
    
```ruby
presentation "My Presentation" do
end
```

`#presentation` indicates the beginning of a presentation. You can have one of these per file. The String passed is used as the title for the presentation.

**slide**

```ruby
presentation "My Presentation" do
  slide "A slide" do
    #…
  end
end
```
    
`#slide` is used to create a new slide. The string is the headline of the slide. `#slide` can take an optional argument of `headline_size:`. Valid options are :small, :medium, :large. These create h3, h2, and h1 elements respectively.

```ruby
presentation "My Presentation" do
  slide "A slide", headline_size: :small do
    #…
  end
end
```

`#slide` can have transitions applied as well. Valid transitions are: :cube, :page, :concave, :zoom, :linear, :fade, :none, and :default

```ruby
presentation "My Presentation" do
  slide "A slide", transition: :slide do
    #…
  end
end
```

`#slide` can have a background color applied. This will only add the color to
this one slide. Any css color will work.

```ruby
presentation "My Presentation" do
  slide "A slide", background_color: 'blue' do
    #…
  end
end
```


**defaults**

```ruby
presentation "My Presentation" do
  defaults headline_size: :medium, transition: :fade
  
  slide "A slide" do
    #…
  end
  
  slide "Some slides override", headline_size: :large do
    #…#…
  end
end
```

You can set slide defaults for `headline_size` or `transition` by using `#defaults`. A slide default applies to all slides unless an individual slide overrides it.
The theme is set to Default.  to change this, use the `set_theme` method in the
presentation block.

``` ruby
presentation "My Presentation" do
  set_theme 'solarized'
end
```

Valid theme options are: default, sky, beige, simple, serif, night, moon, solarized

**plugins**

You can activate revealjs plugins by passing a symbol array to the
`set_plugins` method. 

``` ruby
presentation "My Presentation" do
  set_plugins :class_list, :remote, :leap
end
```

Currently supported plugins are `:class_list`, `:markdown`, `:highlight`, `:zoom`,
`:notes`, `:remote`, and `:leap`.

`:class_list`, `:highlight`, and `:notes` are used if `set_plugins` is
not called.

See Reveal.js [documentation](https://github.com/hakimel/reveal.js/#dependencies) for more info on these plugins.


**points**

```ruby
presentation "My Presentation" do
  slide "A slide" do
    point "An interesting Point"
  end
end
```

`#point` adds p tag wrapped text to your presentation

**grouped_slides**

```ruby
presentation "My Presentation" do
  grouped_slides do
    slide "Slide 1" do
    end
    slide "Slide 2" do
    end
  end
end
```
    
`#grouped_slides` lets you nest slides. In reveal, this translates into vertical slides.

**lists**

```ruby
presentation "My Presentation" do
  slide "Slide 1" do
    list do
      point "An interesting point about monkeys"
      point "An even more interesting point about nargles"
    end
  end
  slide "Slide 2" do
    list(:ordered) do
      point "I should go first"
      point "I'm ok going second"
      list do
        point "I'm in a nested list"
      end
    end
  end
end
```

`#list` must be nested in a slide. It takes an optional argument of :ordered to 
create an ordered list. List items are added by the `#point` method.

**code**

```ruby
presentation "My Presentation" do
  slide "A slide" do
    code(:ruby) do
      "working_code.rb"  
    end
  end
end
```
    
`#code` must be nested in a slide. It loads any code file in the same directory as the file. 
The language passed as an argument will be embedded in the markup. 
code must be in the `code` folder. An optional second argument of a base location can be passed into the code method. Your folder must also have a `code` folder.
All supported languages can be found on the [Highlight.js Page](http://softwaremaniacs.org/media/soft/highlight/test.html)

**note**

```ruby
presentation "My Presentation" do
  slide "A slide" do
    note "Remind them to shower"
  end
end
```

`#note` must be nested in a slide. These will show up on speaker's notes.

**image**

```ruby
presentation "My Presentation" do
  slide "A slide" do
    image "chunky_bacon.png"
  end
end
```    
`#image` must be nested in a slide. All images in the images folder will be ported over on compilation. Use the name of the image, with out the 'images' subfolder
In this example, it will load an image named 'chunky_bacon.png in the images folder.

**media**

    presentation "My Presentation" do
      slide "A slide with video" do
        media "video.mp4", type: video
      end

      slide "A slide with video" do
        media "audio.mp3", type: audio
      end
    end
    
`#media` must be nested in a slide. This will create an auto playing video or audio element on the slide. Files must be in the audio or video directory.

#### Animation

Animation for points are supported.

```ruby
#…
slide do 
  point "My point", animation: "grow"
  list do
    point "My", animation: "step"
    point "Staggered", animation: "step"
    point "List", animation: "step"
  end
end
```

Supported animations are: step, grow, shrink, roll-in, fade-out, highlight-red, highlight-green, and highlight-blue  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
