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

    def winning_spaces
      @winners = [
        game_board[0], 
        game_board[1], 
        game_board[2], 
        game_board.transpose[0], 
        game_board.transpose[1], 
        game_board.transpose[2],
        [game_board[0][0], game_board[1][1], game_board[2][2]],
        [game_board[0][2], game_board[1][1], game_board[2][0]]
      ]
    end
  end

  class Game
    def initialize(board = Board.new)
      @board = board
      @board.format_board
      @board.print_board
    end

    def set_coordinates(coordinate)
      @coordinate = {
        "1" => [0, 0], 
        "2" => [0, 1],
        "3" => [0, 2],
        "4" => [1, 0],
        "5" => [1, 1],
        "6" => [1, 2],
        "7" => [2, 0],
        "8" => [2, 1],
        "9" => [2, 2],
      }
      @x = @coordinate[coordinate].first
      @y = @coordinate[coordinate].last
      map_move
    end

    def map_move
      @board.game_board[@x][@y] = "X"
      puts "========"
      @board.print_board
    end

    def winner?
      puts "------------"
      @board.winning_spaces.each do |winning_rows|
        if winning_rows == ["X", "X", "X"] || winning_rows == ["O", "O", "O"]
          return true
        else
          return false
        end
        # if winning_rows == ["X", "X", "X"] || ["O", "O", "O"]
        #   return true
        # else 
        #   false
        # end
      end
    end

    def draw?
      unless @board.game_board.flatten.any? { |space| space.is_a? Fixnum } || winner?
        true
      else
        false
      end

    end


  end
# end

game = Game.new


p game.draw?










