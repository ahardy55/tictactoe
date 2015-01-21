# module TicTacToe

  class Board
    def initialize
      @board = Array.new(3) {Array.new(3)}
    end

    def format_board
      num = 0
      @board.each do |row|
        row.map! do |space|
          space = num
          num += 1
        end
      end
    end

    def print_board
      self.format_board
      @board.each do |row|
        row.each do |space|
          puts space
        end
      end
    end


  end
# end

board = Board.new
board.print_board

