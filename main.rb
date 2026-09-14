# Just add one white peg for each number
# += string for input than split or join for array so that it nly takes one step

require './lib/game'

# Instructions to user
puts "\r"
puts 'Hello users, you are about to play a game of Mastermind.'
puts "If you don't know the rules, please open your internet browser."
puts "If you don't know how to open your browser, you shouldn't be here."
puts 'To play your turn, you must enter a sequence of four colors and press enter'
puts "\r"

# Game initialization
game = Game.new
game.play_game
