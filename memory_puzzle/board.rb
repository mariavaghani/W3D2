require_relative "card"

class Board
  
  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

#def board_empty?
#end

  def populate
    pairs_left_to_place_hash = {}
    faces = 'PLQTMBRY'.split("")
    faces.each { |pair| pairs_left_to_place_hash[pair] = 2 }

    @grid.each.with_index do |row, row_id|
      row.each.with_index do |ele, col_id|
        random_key = pairs_left_to_place_hash.keys.sample
        while pairs_left_to_place_hash[random_key] == 0
          random_key = pairs_left_to_place_hash.keys.sample
        end
        @grid[row_id][col_id] = Card.new(random_key)
        pairs_left_to_place_hash[random_key] -= 1
      end
    end
  end

  def render
    @grid.each do |sub_arr| 
      row_state = sub_arr.map do |ele|
        if ele.face_down
          " "
        else
          ele.face_value
        end
      end
      puts row_state.join(" ")
    end
  end

  def reveal(guessed_pos) #[r,c]
    row, col = guessed_pos
    if @grid[row][col].face_down 
      @grid[row][col].reveal
    end
  end

  def won?
    @grid.flatten.all? { |ele| ele.face_down == false }
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate
  board.render
  p board.won?
end