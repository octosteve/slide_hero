class List
  attr_reader :style
  def initialize(style=:unordered, &block)
    @style = style == :unordered ? :ul : :ol
    instance_eval(&block)
  end

  def compile
    "<#{style}>" +
      @points.inject(:+) +
    "</#{style}>"
  end

  def point(text)
    points << "<li>#{text}</li>"
  end

  def points
    @points ||= []
  end
end
