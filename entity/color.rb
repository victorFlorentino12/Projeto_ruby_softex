class Color
  attr_reader :r, :g, :b

  def initialize(r, g, b)
    @r = r
    @g = g
    @b = b
    intensity = r * 0.299 + g * 0.587 + b * 0.114
    @foreground = Array.new(3, intensity > 186 ? 0 : 255)
  end

  def foreground_a
    @foreground
  end

  def to_a
    [@r, @g, @b]
  end
end
