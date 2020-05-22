require_relative '../lib/board'
require_relative '../lib/scoring'
require_relative "../lib/tile.rb"

Tile.include Scoring

puts "\n#{"Welcome to Scrabble!".center(50)}\n\n\n"

puts "Would you like to play single player(1) or multiplayer(2)?"

play_mode_answers = ['1', '2']

puts "Choices are #{play_mode_answers}"
play_mode = gets.chomp

puts

puts "Player one"
print "Please enter your word: "
word = gets.chomp

begin
  puts "Your score was: #{Tile.new(word).score}\n\n"
rescue StandardError
  puts "Your word must only contain valid tiles"
end
