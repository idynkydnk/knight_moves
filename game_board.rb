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

    end
  end

end


x = GameBoard.new
x.knight_moves([2,4], [1,8])
x.knight_moves([1,1], [0,4])
