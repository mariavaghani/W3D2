require_relative "card"

class Board
  
  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def populate
    pairs_left_to_place_hash = {}
    faces = 'PLQTMBRY'.split("")
    faces.each { |pair| pairs_left_to_place_hash[pair] = 2 }

    # while @grid.flatten.include?(nil)

    # end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  p board
end