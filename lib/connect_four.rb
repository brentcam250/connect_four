

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
    puts "checking if this column has an e avail #{@grid[x]}"
    return @grid[x].include?("E")
  end 

  def place_piece(x, letter)
    if(column_available?(x))
      first_avail = @grid[x].index("E")
      @grid[x][first_avail] = letter
      # puts @grid[x][first_avail]
      # puts letter
      return true
    else
      return false
    end
  end

  # def find_first_free(x)
  #   #return the y index of the first free space in the column x 
  #   return false unless column_available?(x)



  # end

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

# puts test.place_piece(0,"X")
7.times {test.place_piece(0,"X")}

puts test.place_piece(0,"X")


test.print_grid