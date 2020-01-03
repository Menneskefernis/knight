class Tile
  attr_accessor :x, :y, :move_options

  def initialize(x, y)
    @x = x
    @y = y
    @move_options = []
  end

  def to_s
    "[#{x}, #{y}]"
  end
end