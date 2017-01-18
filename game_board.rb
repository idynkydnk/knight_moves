require_relative 'graph.rb'
class Cell
  attr_accessor :value

  def initialize
    @value = "empty"
  end
end

class GameBoard
  attr_reader :board
  def initialize 
    @board = {} 
    64.times do |x|
      @board[x+1] = Cell.new
    end
  end

  def array_to_integer(array)
    if !location_valid?(array)
      puts "location not valid"
    else
      x = 0
      x = 8 * (array[1] - 1)
      x += array[0]
    end
  end

  def location_valid?(location)
    if location[0] >= 1 && location[0] <= 8 &&
        location[1] >= 1 && location[1] <= 8
      return true
    else
      return false
    end
  end

  def knight_moves(start_loc, end_loc)
    if !location_valid?(start_loc) || !location_valid?(end_loc)
      puts "locations not valid"
    else
      moves = Graph.new
      moves.add_node(start_loc, nil)
      next_move = Node.new([2,3])
      moves.add_node(next_move, moves.root)
      moves.add_node(next_move, moves.root)

      puts moves.root.children
    end
  end

  def add_possible_moves(start_loc, end_loc, moves)
    if start_loc == end_loc
      return moves
    end
    possible_knights_moves = [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1]] 
    possible_knights_moves.each do |possible_move|
      next_move = [start_loc[0] + possible_move[0],start_loc[1] + possible_move[1]]
      if location_valid?(next_move) && !moves.include?(next_move)
        moves << next_move
        add_possible_moves(moves.last, end_loc, moves)
      end
    end
    return moves
  end
end
x = GameBoard.new
x.knight_moves([1,1],[2,3])
