class Human
  attr_reader :board

  def initialize
    @board = []
  end

  def ask_secret_code
    puts 'Please enter your secret code.'
    puts 'It must contains only numbers from 1 to 6.'
    @board = gets.chomp.to_i.digits.reverse
    until @board.length == 4
      puts 'Please enter four numbers between 1 and 6'
      @board = gets.chomp.to_i.digits.reverse
    end
  end

  def display_secret_code
    puts "Your secret code is #{@board}"
    puts '-----------------------------------------------'
  end

  def play_turn
    puts "What's your guess ?"
    @board = gets.chomp.to_i.digits.reverse
    until @board.length == 4
      puts 'Please enter four numbers between 1 and 6.'
      @board = gets.chomp.to_i.digits.reverse
    end
  end

  def replace_element(number)
    @board = @board.map do |e|
      if e == number
        'R'
      else
        e
      end
    end
  end
end
