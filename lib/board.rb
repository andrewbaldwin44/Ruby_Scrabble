require_relative '../lib/tile'
require_relative '../lib/scoring'

class Board < Tile
  DEFAULT_SIZE = 15

  def initialize(tiles, size = DEFAULT_SIZE)
    @game_tiles = Tile.new(tiles)
    @values = @game_tiles.values
    @size = size
  end

  include Scoring

  private
  attr_reader :game_tiles, :values, :size

  public

  attr_reader :values

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
