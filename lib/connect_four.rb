

class ConnectFour 
  attr_accessor :grid
  def initialize()
    @grid = build_grid
  end

  def build_grid
    #initialize a 2-d array dimensions 7x7 full of "E" to start
    output = []
    for i in 0..6
      column = Array.new(7, "E")
      output.push(column)
    end
    return output
  end

  def column_available?(x)
    return @grid[x].include?("E")
  end 

  def place_piece(x, letter)
    if(column_available?(x))
      first_avail = @grid[x].find("E")
      first_avail = letter
      return true
    else
      return false
    end
  end

  def print_grid
    print @grid
  end

end



# class ConnectFourColumn
#   attr_reader :x_position
#   attr_accessor :column
#   def initialize(x_position)
#     #initialize a column full of "E", let it know which x position its in.
#     @column = Array.new(7, "E")
#     @x_position = x_position
#   end


# end

test = ConnectFour.new

puts test.place_piece(0,"PFDSAOFPDASOFD")

test.print_grid