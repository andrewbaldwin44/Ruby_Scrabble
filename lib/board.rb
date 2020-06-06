require_relative '../lib/tile'
require_relative '../lib/scoring'

class Board < Tile
  SIZE = 15

  def initialize
    @board = [
      [' 3w ', '    ', '    ', ' 2l ', '    ', '    ', '    ', ' 3w ', '    ', '    ', '    ', ' 2l ', '    ', '    ', ' 3w '],
      ['    ', ' 2w ', '    ', '    ', '    ', ' 3l ', '    ', '    ', '    ', ' 3l ', '    ', '    ', '    ', ' 2w ', '    '],
      ['    ', '    ', ' 2w ', '    ', '    ', '    ', ' 2l ', '    ', ' 2l ', '    ', '    ', '    ', ' 2w ', '    ', '    '],
      [' 2l ', '    ', '    ', ' 2w ', '    ', '    ', '    ', ' 2l ', '    ', '    ', '    ', ' 2w ', '    ', '    ', ' 2l '],
      ['    ', '    ', '    ', '    ', ' 2w ', '    ', '    ', '    ', '    ', '    ', ' 2w ', '    ', '    ', '    ', '    '],
      ['    ', ' 3l ', '    ', '    ', '    ', ' 3l ', '    ', '    ', '    ', ' 3l ', '    ', '    ', '    ', ' 3l ', '    '],
      ['    ', '    ', ' 2l ', '    ', '    ', '    ', ' 2l ', '    ', ' 2l ', '    ', '    ', '    ', ' 2l ', '    ', '    '],
      [' 3w ', '    ', '    ', ' 2l ', '    ', '    ', '    ', ' ** ', '    ', '    ', '    ', ' 2l ', '    ', '    ', ' 3w '],
    ]

    (0...@board.length - 1).reverse_each { |index| @board << @board[index] }
  end

  include Scoring

  private

  attr_accessor :game_tiles, :values

  public

  attr_accessor :board
  attr_reader :values

  def display
    row_markers = SIZE.times.each_with_object("") do |number, row_marker|
      row_marker << " %3s".center(5) % (number + 1).to_s
    end

    row_seperator = (['|'] * 16).join('----')

    board.each_with_index.each_with_object(matrix = "") do |(row, index)|
      matrix << "   #{row_markers}\n" if index == 0
      matrix << "   #{row_seperator}\n"
      matrix << "%2s |#{row.join('|')}| %2s\n" % [index + 1, index + 1]
      if index == board.length - 1
        matrix << "   #{row_seperator}\n"
        matrix << "   #{row_markers}\n"
      end
      matrix
    end
  end

  def new_letters(letters)
    @game_tiles = Tile.new(letters)
    @values = @game_tiles.values
    self
  end

  def place_letters
    (0...game_tiles.letters.length).each { |index| self.board[7][index + 7] = " #{game_tiles.letters[index]}  " }
  end

  def multiply(tiles, multiplier)
    tiles.chars.map do |tile|
      letter_index = game_tiles.letters.index(tile.upcase.intern)
      self.values[letter_index] = values[letter_index] * multiplier
    end
    self
  end

  def word_times(multiplier)
    self.values = values.map { |value| value * multiplier}
    self
  end
end
