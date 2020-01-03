require_relative 'board'

class Knight
  attr_accessor :game_board
  
  def initialize(board)
    @game_board = board
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

  def traverse(from, to)
    root = find_tile(from[0], from[1])
    return root if root.x == to[0] && root.y == to[1]

    queue = []
    queue << root

    visited = []

    until queue.empty?
      current = queue.shift

      visited << current

      current.move_options.each do |move|
        unless visited.include?(move)
          move.moved_from = current
          return move if move.x == to[0] && move.y == to[1]
          queue << move
        end
      end
    end
  end

  def backtrack_traversal(end_tile)
    current = end_tile

    path = []
    path << current

    until current.moved_from.nil?
      current = current.moved_from
      path.unshift(current)
    end

    path
  end
end