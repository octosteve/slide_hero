# SlideHero

SlideHero is a gem for creating presentations backed by reveal.js through a 
Ruby DSL. 

## Installation

Requires Ruby 2.0.0

Add this line to your application's Gemfile:

    gem 'slide_hero'

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
    
    
    presentation "My Presentation" do
     
    end

`#presentation` indicates the beginning of a presentation. You can have one of these per file. The String passed is used as the title for the presentation.

**slide**

    presentation "My Presentation" do
        slide "A slide" do
          #…
        end
    end
    
`#slide` is used to create a new slide. The string is the headline of the slide. `#slide` can take an optional argument of `headline_size:`. Valid options are :small, :medium, :large. These create h3, h2, and h1 elements respectively.

    presentation "My Presentation" do
        slide "A slide", headline_size: :small do
          #…
        end
    end
    
`#slide` can have transitions applied as well. Valid transitions are: :cube, :page, :concave, :zoom, :linear, :fade, :none, and :default

    presentation "My Presentation" do
        slide "A slide", transition: :slide do
          #…
        end
    end
    
**points**

    presentation "My Presentation" do
      slide "A slide" do
        point "An interesting Point"
      end
    end

`#point` adds p tag wrapped text to your presentation

**grouped_slides**

    presentation "My Presentation" do
        grouped_slides do
          slide "Slide 1" do
          end
          slide "Slide 2" do
          end
        end
    end
    
`#grouped_slides` lets you nest slides. In reveal, this translates into vertical slides.

**lists**


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
         end
       end
    end

`#list` must be nested in a slide. It takes an optional argument of :ordered to 
create an ordered list. List items are added by the `#point` method.

**code**

    presentation "My Presentation" do
      slide "A slide" do
        code(:ruby) do
          "working_code.rb"  
        end
      end
    end
    
`#code` must be nested in a slide. It loads any code file in the same directory as the file. 

**note**

    presentation "My Presentation" do
      slide "A slide" do
        note "Remind them to shower"
      end
    end
    
`#note` must be nested in a slide. These will show up on speaker's notes.

#### Animation

Animation for points are supported.

    #…
    slide do 
      point "My point", animation: "grow"
      list do
        point "My", animation: "step"
        point "Staggered", animation: "step"
        point "List", animation: "step"
      end
    end

Supported animations are: step, grow, shrink, roll-in, fade-out, highlight-red, highlight-green, and highlight-blue  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
