require_relative "board"
require_relative "human_player"

class Game
  NUMS = "0123"

  
  def initialize(player)
    @board = Board.new
    @board.populate
    @player = player
    @previous_guess = nil
  end
  
 

  def render_board
    system("clear")
    @board.render
    sleep(1)
    
  end

  def run
    @board.populate
    puts "Welcome to guessing game!"
    until @board.won?
      render_board
      pos = @player.prompt
      match_or_not(pos) if @board.reveal(pos) #card is flipped up!    
    end
    puts "You won!!"
  end

  def match_or_not(pos)
    render_board
    if @previous_guess
      unless @previous_guess == @board[pos]

        #flip both card face down
        @previous_guess.hide
        @board[pos].hide
        @previous_guess = nil
      else
        @previous_guess = nil
      end
    else
      @previous_guess = @board[pos]
    end
  end



end


if __FILE__ == $PROGRAM_NAME

  player = HumanPlayer.new
  game = Game.new(player)
  game.run
end