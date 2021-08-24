class Card
  
  attr_reader :face_value, :face_down
  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
  end

  def to_s
    @face_value
  end

  def ==(other_card)
    @face_value == other_card.face_value
  end
end

if __FILE__ == $PROGRAM_NAME
  card = Card.new("t")
  # puts card.to_s
  other_card = Card.new("y")
  p card == other_card
end