require_relative '../lib/board'
require_relative '../lib/scoring'
require_relative "../lib/style.rb"
require_relative "../lib/tile.rb"

Tile.include Scoring
Tile.include Board

include TextStyles

puts "\n#{"Welcome to Scrabble!".red_white_highlight.center(70)}\n\n\n"

puts "Would you like to play single player(1) or multiplayer(2)?"
play_mode = get_input
play_mode = validate_play_mode

puts

puts "Player one".blue_block.underline
print "Please enter your word: "
word = get_input
word = validate_word
puts "Your score was: #{Tile.new(word).score}\n\n"
