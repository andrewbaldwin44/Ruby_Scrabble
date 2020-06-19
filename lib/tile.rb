require_relative '../lib/exceptions'

class Tile
  TILES = {
    'A' => { value: 1, quantity: 9 },  'N' => { value: 1,  quantity: 6 },
    'B' => { value: 3, quantity: 2 },  'O' => { value: 1,  quantity: 8 },
    'C' => { value: 3, quantity: 2 },  'P' => { value: 3,  quantity: 2 },
    'D' => { value: 2, quantity: 4 },  'Q' => { value: 10, quantity: 1 },
    'E' => { value: 1, quantity: 12 }, 'R' => { value: 1,  quantity: 6 },
    'F' => { value: 4, quantity: 4 },  'S' => { value: 1,  quantity: 4 },
    'G' => { value: 2, quantity: 3 },  'T' => { value: 1,  quantity: 6 },
    'H' => { value: 4, quantity: 2 },  'U' => { value: 1,  quantity: 4 },
    'I' => { value: 1, quantity: 9 },  'V' => { value: 4,  quantity: 2 },
    'J' => { value: 8, quantity: 1 },  'W' => { value: 4,  quantity: 2 },
    'K' => { value: 5, quantity: 1 },  'X' => { value: 8,  quantity: 1 },
    'L' => { value: 1, quantity: 4 },  'Y' => { value: 4,  quantity: 2 },
    'M' => { value: 3, quantity: 2 },  'Z' => { value: 10, quantity: 1 },
    ' ' => { value: 0, quantity: 2 }
  }

  def initialize(letters)
    @letters = letters.upcase.chars
  end

  protected
  attr_reader :letters

  public

  def values
    @values ||= letters.map do |tile|
      raise TileError unless TILES.include?(tile)
      value = TILES[tile][:value]
    end
  end
end
