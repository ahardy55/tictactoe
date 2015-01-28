# module TicTacToe

  class Board
    attr_accessor :game_board, :winners
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
      @formatted = @board.format_board

    end

    def available_spaces
      @available_spaces = []
      @board.game_board.each do |row|
        row.each do |space|
          if (1..9).include?(space)
            @available_spaces << space
          end
        end
      end

      @available_spaces

    end

    def coordinates
      @coordinates ||= {
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
    end

    def set_coordinates(coordinate)
      @x = coordinates[coordinate].first
      @y = coordinates[coordinate].last
    end


    def map_move(move)
      @current_player = players.human
      available_spaces
      set_coordinates(move)
      if available_spaces.include?(@board.game_board[@x][@y])
        @board.game_board[@x][@y] = @players.human["symbol"]
        @board.print_board
      else
        puts "This space has already been marked"
        puts "Choose a new space"
        map_move(gets.chomp)
      end
    end

    def computer_move
      @current_player = players.computer
      available_spaces
      computer_coordinate = available_spaces.sample.to_s
      set_coordinates(computer_coordinate)
      @board.game_board[@x][@y] = @players.computer["symbol"]
      @board.print_board
    end

    def winner?
      @board.winning_spaces.each do |row|
        if row == ["X", "X", "X"] || row == ["O", "O", "O"]
          return true
        else
          false
        end
      end
    end

    def draw?
      unless @board.game_board.flatten.any? { |space| space.is_a? Fixnum } || winner?
        true
      else
        false
      end
    end

    def game_over?
      return winner? if winner?
      return draw if draw?
      false
    end

    def welcome_message
      puts "Welcome to Tic Tac Toe"
      puts "Please Enter Your Name"
      @players = CreatePlayer.new(gets.chomp)
      @players.set_symbols
      puts "Welcome #{@players.human["name"]}"
    end

    def play
      welcome_message

      until game_over? == true
        if @players.human["symbol"] == "X"
          puts "#{@players.human["name"]}'s Turn"
          map_move(gets.chomp)
          break if game_over? == true
          puts "#{@players.computer["name"]}'s Turn"
          computer_move
        else
          puts "#{@players.computer["name"]}'s Turn"
          computer_move
          break if game_over? == true
          puts "#{@players.human["name"]}'s Turn"
          map_move(gets.chomp)
        end
      end
    end

  end

  class CreatePlayer
    attr_accessor :human, :computer
    def initialize(name)
      @human = {
        "name" => name, 
        "symbol" => ""
      } 

      @computer = {
        "name" => "Computer", 
        "symbol" => ""
      }
    end

    def switch_player(current_name)
      if current_name == "Computer"
        return @human
      else
        return @computer
      end
    end

    def set_symbols
      symbols = ["X", "O"].shuffle
      @human["symbol"] = symbols.pop
      @computer["symbol"] = symbols.pop
    end
    
  end
# end


game = Game.new
game.play







