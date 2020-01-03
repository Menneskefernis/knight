require_relative 'board'

class Knight
  attr_accessor :game_board
  def initialize
    @game_board = Board.new
    connect_tiles
    #puts game_board.board[0][1].move_options
  end

  def connect_tiles
    game_board.board.each do |column|
      column.each do |tile|
        tile.move_options = possible_moves(tile)
      end
    end
  end

  def possible_moves(tile)
    moves = []
    
    operators = [["+", "+"], ["-", "-"], ["-", "+"], ["+", "-"]]
    x_move = 1
    y_move = 2  
  
    operators.each do |op|
      2.times do
        x_position = tile.x.send(op[0], x_move)
        y_position = tile.y.send(op[1], y_move)
        
        unless [x_position, y_position].any? { |ele| ele < 1 || ele > 8 }
          moves << find_tile(x_position, y_position)
        end
        x_move, y_move = y_move, x_move
      end
    end
    moves
  end

  def find_tile(x, y)
    game_board.board.each do |column|
      column.each do |tile|
        if tile.x == x && tile.y == y
          return tile
        end
      end
    end
  end
end