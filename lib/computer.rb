class Computer
  attr_reader :board

  def initialize
    @board = []
    @turn_count = 0
  end

  def generate_secret_code
    @board = 4.times.map { rand(1..6) }
  end

  def display_secret_code
    puts "Secret code is #{@board}"
    puts '-----------------------------------------------'
  end

  def play_turn
    @board = 4.times.map { rand(1..6) }
    puts "Computer played #{@board}"
  end
end
