#entity/candidate

class Candidate
  attr_reader :name, :color

  def initialize(name, color, char = "★")
    @name = name
    @color = color
    @char = char
  end

  def name_with_background(size = 0)
    "\e[38;2;#{@color.foreground_a.join(";")}m\e[48;2;#{@color.to_a.join(";")}m#{(@char + " #{@name} " + @char).center(size)}\e[0m"
  end

  def name_with_color(size = 0)
    "\e[38;2;#{@color.to_a.join(";")}m#{@name.center(size)}\e[0m"
  end
end
