

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
    # puts "checking if this column has an 'E' avail #{@grid[x]}"
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

  def is_win?
    winner = false
    @grid.each do |row|
      #check horizontal winners
      winner = "R" if row.join.include?("RRRR")
      winner = "B" if row.join.include?("BBBB")
    end
    7.times do |i|
      col = []
      6.times do |j|
        col << @grid[j][i]
      end
      #check vertical winners
      winner = "R" if col.join.include?("RRRR");
      winner = "B" if col.join.include?("BBBB");
    end

    # @grid.each_with_index do |row, row_index|
    #   row.each_with_index do |cell, column_index|
    #     if

    return winner
  end

  def print_grid
    @grid.each do |row|
      p row
    end
  end

  def output_space(x, y)
    return @grid[x][y]
  end

  def play_game
    i = 0
    until(is_win?)
      print_grid
      puts "player #{i%2 == 0 ? "R": "B"} turn which column do you want to place your piece in? 0-6"
      column = gets.chomp.to_i
      until(0..6).include?(column)
        puts "please choose a number from 0-6"
        column = gets.chomp.to_i
      end
      i % 2 ==0 ? place_piece(column, "R") : place_piece(column, "B")
      i += 1
    end
    puts "winner is: #{is_win?}"
  end

end



test = ConnectFour.new

# puts test.place_piece(0,"X")
7.times {test.place_piece(0,"X")}

puts test.place_piece(0,"X")

test.play_game