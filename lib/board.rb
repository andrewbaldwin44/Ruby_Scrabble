require_relative '../lib/tile'
require_relative '../lib/scoring'

class Board < Tile
  SIZE = 15
  CENTER = 7
  FIELD_WIDTH = 4
  BOARD_OFFSET = 6
  COORDINATE_WIDTH = 2

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
    game_tiles.letters.length.times do |index|
      self.board[CENTER][index + CENTER] =
        "%<letter>s" % [letter: game_tiles.letters[index]]
    end
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

  def matrix()
    row_markers = SIZE.times.each_with_object("") do |number, row_marker|
      row_marker << "%#{BOARD_OFFSET - COORDINATE_WIDTH}s".center(FIELD_WIDTH) % number.next
    end

    row_seperator = (['|'] * SIZE.next).join('-' * FIELD_WIDTH)

    matrix = "%s\n".rjust(BOARD_OFFSET) % row_markers

    board_display = board.map { |row| row.map { |square| square.to_s.center(FIELD_WIDTH) }}

    board_display.each_with_index.each_with_object(matrix) do |(row, index)|
      matrix << "%s\n".rjust(BOARD_OFFSET) % row_seperator
      matrix <<
        "%#{COORDINATE_WIDTH}s |#{row.join('|')}| %#{COORDINATE_WIDTH}s\n" \
        % [index.next, index.next]
    end

    matrix << "%s\n".rjust(BOARD_OFFSET) % row_seperator
    matrix << "%s\n".rjust(BOARD_OFFSET) % row_markers
  end

  def to_s
    matrix
  end
end
