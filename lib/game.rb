class Game
  @@turn_count = 1
  @@range = [1, 2, 3, 4, 5, 6]

  def initialize
    @board = []
    @guess = []
    @pegs = []
    i = 0
    while i < 4
      rand_index = rand(6)
      @board.push(@@range[rand_index])
      i += 1
    end
    puts "Secret code is #{@board}"
  end

  def play_turn
    i = 0
    @guess = []
    puts "Turn : #{@@turn_count}"
    puts "What's your guess ?"

    while i < @board.length
      get_guess = gets.chomp.to_i
      until (get_guess > 0) && (get_guess < 7)
        puts 'Please enter a number between 1 and 6s'
        get_guess = gets.chomp.to_i
      end
      @guess.push(get_guess)
      i += 1
    end
    puts "Guess is #{@guess}"
  end

  def check_win
    return unless @board == @guess

    puts "Congrats, you win the game in #{@@turn_count} turns."
    @@turn_count = 10
  end

  def compare_board
    i = 0
    @pegs = []
    puts "Pegs is #{@pegs}"
    while i < @board.length
      if @board[i] == @guess[i]
        @pegs.push('X')
      elsif @board.any?(@guess[i])
        @pegs.push('0')
      end
      i += 1
    end
    puts "Your guess returns #{@pegs}"
    puts "\r"
    @@turn_count += 1
  end

  def check_win
    if @board == @guess
      puts "Congrats, you win the game in #{@@turn_count} turns."
      @@turn_count = 10
    elsif @@turn_count == 11
      puts 'You lose, sorry about that.'
    end
    @@turn_count += 1
  end

  def play_game
    until @@turn_count >= 10
      play_turn
      compare_board
      check_win
    end
  end
end
