class Tile
  attr_accessor :x, :y, :move_options, :moved_from

  def initialize(x, y)
    @x = x
    @y = y
    @moved_from = nil
    @move_options = []
  end

  def to_s
    "[#{x}, #{y}]"
  end
end