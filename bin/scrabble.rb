require_relative "../lib/style.rb"
require_relative "../bin/input.rb"
require_relative "../lib/tile.rb"

clear_screen = ->{print `clear`}
welcome_screen = ->{puts "\n#{"Welcome to Scrabble!".red_white_highlight.center(70)}\n\n\n"}

clear_screen.call
welcome_screen.call
puts "Would you like to play single player(1) or multiplayer(2)?"
play_mode = UserInput.get_play_mode

clear_screen.call
welcome_screen.call

loop do
  puts "Player one".blue_block.underline
  print "Please enter your word: "
  word = UserInput.get_user_word
  puts "Your score was: #{Tile.new(word).score}\n\n"
end
