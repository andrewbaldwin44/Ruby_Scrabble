require_relative '../lib/tile'
require_relative '../lib/scoring'

class Board < Tile
  SIZE = 15

  m3w = '3W'
  m2w = '2W'
  m3l = '3L'
  m2l = '2L'
  BOARD = [
    [m3w, nil, nil, m2l, nil, nil, nil, m3w, nil, nil, nil, m2l, nil, nil, m3w],
    [nil, m2w, nil, nil, nil, m3l, nil, nil, nil, m3l, nil, nil, nil, m2w, nil],
    [nil, nil, m2w, nil, nil, nil, m2l, nil, m2l, nil, nil, nil, m2w, nil, nil],
    [m2l, nil, nil, m2w, nil, nil, nil, m2l, nil, nil, nil, m2w, nil, nil, m2l],
    [nil, nil, nil, nil, m2w, nil, nil, nil, nil, nil, m2w, nil, nil, nil, nil],
    [nil, m3l, nil, nil, nil, m3l, nil, nil, nil, m3l, nil, nil, nil, m3l, nil],
    [nil, nil, m2l, nil, nil, nil, m2l, nil, m2l, nil, nil, nil, m2l, nil, nil],
    [m3w, nil, nil, m2l, nil, nil, nil, '**', nil, nil, nil, m2l, nil, nil, m3w],
    [nil, nil, m2l, nil, nil, nil, m2l, nil, m2l, nil, nil, nil, m2l, nil, nil],
    [nil, m3l, nil, nil, nil, m3l, nil, nil, nil, m3l, nil, nil, nil, m3l, nil],
    [nil, nil, nil, nil, m2w, nil, nil, nil, nil, nil, m2w, nil, nil, nil, nil],
    [m2l, nil, nil, m2w, nil, nil, nil, m2l, nil, nil, nil, m2w, nil, nil, m2l],
    [nil, nil, m2w, nil, nil, nil, m2l, nil, m2l, nil, nil, nil, m2w, nil, nil],
    [nil, m2w, nil, nil, nil, m3l, nil, nil, nil, m3l, nil, nil, nil, m2w, nil],
    [m3w, nil, nil, m2l, nil, nil, nil, m3w, nil, nil, nil, m2l, nil, nil, m3w],
  ]

  def initialize(board = BOARD)
    @board = BOARD
  end

  include Scoring

  private

  attr_accessor :game_tiles, :values

  public

  attr_accessor :board
  attr_reader :values

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

  def to_s
    row_markers = SIZE.times.each_with_object("") do |number, row_marker|
      row_marker << " %3s".center(5) % (number + 1).to_s
    end

    row_seperator = (['|'] * 16).join('----')

    board_display = board.map { |row| row.map { |square| square.to_s.center(4) }}

    board_display.each_with_index.each_with_object(matrix = "") do |(row, index)|
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
end
