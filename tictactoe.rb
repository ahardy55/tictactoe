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
        puts row.each { |space| space}.join(" ")
      end
    end
  end

  class Game
    def initialize(board = Board.new)
      @board = board
      @board.print_board
    end

  end
# end

board = Game.new



