module Board
  SIZE = 15

  def multiply_tiles(tiles, multiplier)
    tiles.chars.map do |tile|
      letter_index = letters.index(tile.upcase.intern)
      self.values[letter_index] = values[letter_index] * multiplier
    end
    self
  end

  def multiply_all_tiles(multiplier)
    self.values = values.map { |value| value * multiplier}
    self
  end

  def double_letters(letters)
    multiply_tiles(letters, 2)
  end

  def triple_letters(letters)
    multiply_tiles(letters, 3)
  end

  def double_word
    multiply_all_tiles(2)
  end

  def triple_word
    multiply_all_tiles(3)
  end
end
