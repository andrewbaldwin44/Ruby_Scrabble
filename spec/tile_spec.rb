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
    expect(Tile.new('discombobulated').values).must_equal [2, 1, 1, 3, 1, 3, 3, 1, 3, 1, 1, 1, 1, 1, 2]
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

  it 'must raise a TileError when given invalid @ tile' do
    assert_raises(TileError) {Tile.new('fa@lure').values}
  end

  it 'must raise a TileError when given any invalid tile' do
    assert_raises(TileError) {Tile.new('fa|lure').values}
  end
end
