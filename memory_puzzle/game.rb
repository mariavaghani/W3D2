require_relative "board"

class Game
  NUMS = "0123"

  
  def initialize()
    @board = Board.new.populate
    @previous_guess = nil
  end
  
  def make_guess
    puts "Enter the position"
    pos = gets.chomp.split(",")
    unless pos.all? { |str| NUMS.include?(str) }
      puts "Enter try again"
      pos = gets.chomp.split(",")
    end
    #@previous_guess = pos.map(&:to_i)
    pos.map(&:to_i)
  end

  def run
    puts "Welcome to guessing game!"
    unless @board.won?
      @board.render
      pos = make_guess
       @board.reveal(pos) #card is flipped up!

    end
    
  end

  def match_or_not(pos)
    if @previous_guess
      if @previous_guess == @board[pos]
        #keep both cards up

      else
        #flip both card face down
        .hide(pos)
      end
      end
    else
      @previous_guess = @board[pos]
    end
  end



end


if __FILE__ == $PROGRAM_NAME


  game = Game.new
  p game.make_guess
end