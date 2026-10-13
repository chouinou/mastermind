# Just add one white peg for each number
# += string for input than split or join for array so that it nly takes one step

require './lib/game'

game = Game.new
game.run

# attempt on stragizing the computer AI
# Create the list 1111,...,6666 of all candidate secret codes
# Start with 1122.
# Repeat the following 2 steps:

# 1) After you got the answer (number of red and number of white pegs) eliminate from the list of candidates all codes that would not have produced the same answer if they were the secret code.

# 2) Pick the first element in the list and use it as new guess.

# This averages no more than 5 guesses.

# This is the Swaszek (1999-2000) strategy that was mentioned in another answer.
