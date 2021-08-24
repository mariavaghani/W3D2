require_relative "board"

class Game
  NUMS = "0123"

  
  def initialize()
    @board = Board.new

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
    @board.populate
    puts "Welcome to guessing game!"
    until @board.won?
      system("clear")
      sleep(1)
      @board.render
      pos = make_guess
      match_or_not(pos) if @board.reveal(pos) #card is flipped up!
        

    end
    
  end

  def match_or_not(pos)
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


  game = Game.new
  game.run
end