require_relative '../lib/tile'
require_relative '../lib/scoring'

class Board < Tile
  def initialize
  end

  include Scoring

  private

  attr_accessor :game_tiles, :values

  public

  attr_reader :values

  def new_letters(letters)
    @game_tiles = Tile.new(letters)
    @values = @game_tiles.values
    self
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
