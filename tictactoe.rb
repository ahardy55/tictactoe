# module TicTacToe

  class Board
    attr_accessor :game_board
    def initialize
      @game_board = Array.new(3) {Array.new(3)}
    end

    def format_board
      num = 0
      @game_board.each do |row|
        row.map! do |space|
          space = num
          num += 1
        end
      end
    end

    def print_board
      @game_board.each do |row|
        puts row.each { |space| space}.join(" ")
      end
    end
  end

  class Game
    def initialize(board = Board.new)
      @board = board
      @board.format_board
      @board.print_board
    end

    def map_move(coordinate)
      @coordinate = coordinate

      if @coordinate == "1"
        @board.game_board[0][0] = "X"
      end

      @board.print_board
    end

  end
# end

board = Game.new
board.map_move("1")



