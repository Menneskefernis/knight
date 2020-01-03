require_relative 'knight'

board = Board.new
$knight = Knight.new(board)

def knight_moves(from, to)
  path = $knight.backtrack_traversal($knight.traverse(from, to))
  puts "You can move from #{from} to #{to} in #{path.size - 1} move(s):"
  puts path
  puts ""
  $knight.reset_path
end

knight_moves([4, 8], [1, 8])
knight_moves([4, 5], [1, 5])