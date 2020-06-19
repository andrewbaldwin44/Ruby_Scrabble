require_relative '../lib/exceptions'

class Tile
  TILES = {
    A: { VALUE: 1, QUANTITY: 9 },  N: { VALUE: 1,  QUANTITY: 6 },
    B: { VALUE: 3, QUANTITY: 2 },  O: { VALUE: 1,  QUANTITY: 8 },
    C: { VALUE: 3, QUANTITY: 2 },  P: { VALUE: 3,  QUANTITY: 2 },
    D: { VALUE: 2, QUANTITY: 4 },  Q: { VALUE: 10, QUANTITY: 1 },
    E: { VALUE: 1, QUANTITY: 12 }, R: { VALUE: 1,  QUANTITY: 6 },
    F: { VALUE: 4, QUANTITY: 4 },  S: { VALUE: 1,  QUANTITY: 4 },
    G: { VALUE: 2, QUANTITY: 3 },  T: { VALUE: 1,  QUANTITY: 6 },
    H: { VALUE: 4, QUANTITY: 2 },  U: { VALUE: 1,  QUANTITY: 4 },
    I: { VALUE: 1, QUANTITY: 9 },  V: { VALUE: 4,  QUANTITY: 2 },
    J: { VALUE: 8, QUANTITY: 1 },  W: { VALUE: 4,  QUANTITY: 2 },
    K: { VALUE: 5, QUANTITY: 1 },  X: { VALUE: 8,  QUANTITY: 1 },
    L: { VALUE: 1, QUANTITY: 4 },  Y: { VALUE: 4,  QUANTITY: 2 },
    M: { VALUE: 3, QUANTITY: 2 },  Z: { VALUE: 10, QUANTITY: 1 },
    ' ': { VALUE: 0, QUANTITY: 2 }
  }

  def initialize(letters)
    @letters = letters.upcase.chars.map(&:intern)
  end

  protected
  attr_reader :letters

  public

  def values
    @values ||= letters.map do |tile|
      raise TileError unless TILES.include?(tile)
      value = TILES[tile][:VALUE]
    end
  end
end
