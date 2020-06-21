require_relative '../lib/tile'
require_relative '../lib/scoring'

class Board < Tile
  Geometry = {
    size: 15,
    center: 7,
    field_width: 4,
    board_offset: 6,
    coordinate_width: 2
  }

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
      self.board[Geometry[:center]][index + Geometry[:center]] =
        "%<letter>s" % [letter: game_tiles.letters[index]]
    end
  end

  def multiply(tiles, multiplier)
    tiles.chars.map do |tile|
      letter_index = game_tiles.letters.index(tile.upcase)
      self.values[letter_index] = values[letter_index] * multiplier
    end
    self
  end

  def word_times(multiplier)
    self.values = values.map { |value| value * multiplier}
    self
  end

  def matrix()
    row_markers = Geometry[:size].times.each_with_object("") do |number, row_marker|
      actual_width = Geometry[:board_offset] - Geometry[:coordinate_width]
      row_marker << "%#{actual_width}s".center(Geometry[:field_width]) % number.next
    end

    row_seperator = (['|'] * Geometry[:size].next).join('-' * Geometry[:field_width])
    offset_row = "%s\n".rjust(Geometry[:board_offset])

    matrix = offset_row % row_markers

    board_display = board.map { |row| row.map do |square|
      square.to_s.center(Geometry[:field_width])
    end
    }

    board_display.each_with_index.each_with_object(matrix) do |(row, index)|
      matrix << offset_row % row_seperator
      matrix <<
      "%#{Geometry[:coordinate_width]}s |#{row.join('|')}| %#{Geometry[:coordinate_width]}s\n" %
        [index.next, index.next]
    end

    matrix << offset_row % row_seperator
    matrix << offset_row % row_markers
  end

  def to_s
    matrix
  end
end
