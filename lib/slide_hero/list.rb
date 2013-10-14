class List
  def initialize(&block)
    instance_eval(&block)
  end

  def compile
    "<ul>" +
      @points.inject(:+) +
    "</ul>"
  end

  def point(text)
    points << "<li>#{text}</li>"
  end

  def points
    @points ||= []
  end
end
