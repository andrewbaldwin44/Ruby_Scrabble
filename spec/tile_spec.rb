require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/tile'
require_relative '../lib/exceptions'

describe Tile do
  it 'must evaluate a single letter' do
    expect(Tile.new('a').values).must_equal [1]
  end

  it 'must evaluate a short word' do
    expect(Tile.new('apple').values).must_equal [1, 3, 3, 1, 1]
  end

  it 'must evaluate a long word' do
    expected = [2, 1, 1, 3, 1, 3, 3, 1, 3, 1, 1, 1, 1, 1, 2]
    tiles = Tile.new('discombobulated')
    expect(tiles.values).must_equal expected
  end

  it 'must evaluate a word with capitilization' do
    expect(Tile.new('Spoon').values).must_equal [1, 3, 1, 1, 1]
  end

  it 'must evaluate a word in all caps' do
    expect(Tile.new('FORKS').values).must_equal [4, 1, 1, 5, 1]
  end

  it 'must evaluate a word with blanks' do
    expect(Tile.new('qui otic').values).must_equal [10, 1, 1, 0, 1, 1, 1, 3]
  end

  it 'must raise a TileError when given any invalid tile' do
    ['!', '?', '%', '…', '|', '@'].each do |invalid_character|
      assert_raises(TileError) {Tile.new('fa%slure' % invalid_character).values}
    end
  end

  it 'must provide a helpful exception message' do
    exception = expect(-> {Tile.new('!').values}).must_raise(TileError)
    expect(exception.message).must_match(/invalid/i)
  end
end
