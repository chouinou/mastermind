require './lib/human'
require './lib/computer'

class Game
  def initialize
    @human = Human.new
    @computer = Computer.new
    @pegs = []
    @winner = nil
  end

  def run
    display_instructions
    ask_user_role

    if human_breaker?
      @computer.generate_secret_code
      @computer.display_secret_code

      10.times do |i| # regardez la doc
        turn_count = i + 1
        puts "Turn : #{turn_count}"
        @human.play_turn
        return display_user_win if game_won?

        give_hints
      end
      display_user_loss
    else
      @human.ask_secret_code
      @human.display_secret_code
      10.times do |i| # regardez la doc
        turn_count = i + 1
        puts "Turn : #{turn_count}"
        @computer.play_turn
        return display_user_loss if game_won?

        # @computer.train
      end
      display_user_win
    end
  end

  private # upfront methods shouldn't be called outside the class

  def display_instructions
    puts "\r"
    puts 'Hello user, you are about to play a game of Mastermind.'
    puts "If you don't know the rules, please open your internet browser."
    puts "If you don't know how to open your browser, you shouldn't be here."
    puts 'Do you want to be the code break or the code maker ?'
    puts 'Enter B for breaker or M for maker'
  end

  def ask_user_role
    @user_role = gets.chomp
    return if %w[M B].include?(@user_role)

    puts 'Please enter B for breaker or M for maker'
    ask_user_role
  end

  def human_breaker?
    @user_role == 'B'
  end

  def game_won?
    @human.board == @computer.board
  end

  def display_user_win
    puts 'Congrats, you win.'
  end

  def display_user_loss
    puts 'AH ! You lose.'
  end

  def give_hints
    @pegs = []
    puts "Your guess : #{@human.board}"
    count_matches
    count_correct_number
    puts "Hints :  #{@pegs}"
    puts "\r"
  end

  def count_matches
    4.times do |i|
      @pegs.push('X') if matches?(i)
    end
  end

  def count_correct_number
    # bug when no matches but correct number with another matches
    4.times do |i|
      @pegs.push('0') if !matches?(i) && @computer.board.include?(@human.board[i])
      @human.replace_element(@human.board[i])
    end
  end

  def matches?(i)
    @computer.board[i] == @human.board[i]
  end
end
