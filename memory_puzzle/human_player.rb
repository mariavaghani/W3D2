class HumanPlayer
  NUMS = "0123"

  def prompt
    puts "Enter the position"
    pos = gets.chomp.split(",")
    until pos.length == 2 && pos.all? { |str| NUMS.include?(str) }
      puts "Enter try again"
      pos = gets.chomp.split(",")
    end

    pos.map(&:to_i)
  end
end