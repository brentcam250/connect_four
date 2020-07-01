require './lib/connect_four.rb'

describe ConnectFour do
  it "initializes a 7x7 array of 'E'"do
    connect_four = ConnectFour.new
    test_grid = connect_four.grid.flatten.uniq
    expect(test_grid.length == 1 && test_grid[0] == 'E').to eql(true)
  end

  describe '#column_available?' do 
    it "returns false when the column is full" do 
      connect_four = ConnectFour.new
      7.times {connect_four.place_piece(0, "R")}
      expect(connect_four.column_available?(0)).to eql(false)
    end
  end

  describe '#place_piece' do 
    it "places a correct colour piece in the correct spot" do 
      connect_four = ConnectFour.new
      connect_four.place_piece(0, "R")
      expect(connect_four.output_space(0,0)).to eql('R')
    end
    it "returns false if the column is full" do
      connect_four = ConnectFour.new
      7.times {connect_four.place_piece(0, "R")}
      expect(connect_four.place_piece(0, "R")).to eql(false)
    end

    describe '#get_winner' do 
      it "recognizes a horizontal win" do
        connect_four = ConnectFour.new
        for i in 0..4 do 
          connect_four.place_piece(i, "R")
        end
        expect(connect_four.is_win?).to eql("R")
      end

      it "recognizes a vertical win" do 
        connect_four = ConnectFour.new
        4.times {(connect_four.place_piece(0, "R"))}
        expect(connect_four.is_win?).to eql("R")
      end

      it "recognizes a positive slope win" do 
        connect_four = ConnectFour.new
        connect_four.place_piece(0, "R")
        connect_four.place_piece(1, "B")
        connect_four.place_piece(1, "R")
        2.times {connect_four.place_piece(2, "B")}
        connect_four.place_piece(2, "R")
        3.times {connect_four.place_piece(3, "B")}
        connect_four.place_piece(3, "R")
        expect(connect_four.is_win?).to eql(true)
      end

      it "recognizes a negative slope win" do
        connect_four = ConnectFour.new
        connect_four.place_piece(3, "R")
        connect_four.place_piece(2, "B")
        connect_four.place_piece(2, "R")
        2.times {connect_four.place_piece(1, "B")}
        connect_four.place_piece(1, "R")
        3.times {connect_four.place_piece(0, "B")}
        connect_four.place_piece(0, "R")
        expect(connect_four.is_win?).to eql(true)
      end
      it "doesnt give a false positive" do 
        connect_four = ConnectFour.new
        expect(connect_four.is_win?).to eql(false)
      end
    end
  end
end