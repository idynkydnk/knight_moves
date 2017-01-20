class Knight
  attr_accessor :position, :possible_moves, :board, :parent

  def initialize(position = nil)
    @position = position
    @parent = nil
    @board = create_board
    @possible_moves = new_moves(position = [0,0])
  end

  def create_board 
    board = [] 
    8.times do |x|
      8.times do |y|
        board << [x,y]
      end
    end
  end

  def location_valid?(location)
    if location[0] >= 0 && location[0] <= 7 &&
        location[1] >= 0 && location[1] <= 7
      return true
    else
      return false
    end
  end

  def new_moves(start_loc)
    moves = []
    possible_moves = [[1,2], [1,-2], [-1,2], [-1,-2], [2,1], [2,-1], [-2,1], [-2,-1]] 
    possible_moves.each do |possible_move|
      next_move = [start_loc[0] + possible_move[0],start_loc[1] + possible_move[1]]
      if location_valid?(next_move)
        moves << next_move
      end
    end
    return moves
  end

  def knight_moves(start_loc, end_loc)
    if !location_valid?(start_loc) || !location_valid?(end_loc)
      puts "Your positions aren't valid!"
    else
      knight = Knight.new(start_loc)
      moves = [knight]
      until moves[0].position == end_loc
        prev_move = moves.shift
        new_moves(prev_move.position).each do |move|
          knight = Knight.new(move)
          knight.parent = prev_move
          moves << knight
        end
      end
      current_knight = moves[0]
      path = []
      until current_knight.parent == nil
        path.unshift(current_knight.position)
        current_knight = current_knight.parent
      end
      path.unshift(current_knight.position)
      puts "Shortest path is..."
      path.each do |spot|
        print spot.to_s + " "
      end
      puts
    end
  end

end
x = Knight.new
x.knight_moves([2,5],[5,7])
x.knight_moves([1,7],[4,3])
x.knight_moves([6,5],[1,2])
