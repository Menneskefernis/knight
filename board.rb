require_relative 'tile'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    self.insert_tiles
  end

  def insert_tiles
    self.board = board.each_with_index.map do |column, i|
      column.each_with_index.map do |row, j|
        row = Tile.new(i + 1, j + 1)
      end
    end
  end
end