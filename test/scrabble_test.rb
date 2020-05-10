require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/tile'
require_relative '../lib/scoring'
require_relative '../lib/board'

describe Tile do
  it 'must score a single letter' do
    expect(Tile.new('a').values).must_equal [1]
  end
  it 'must score a short word' do
    expect(Tile.new('apple').values).must_equal [1, 3, 3, 1, 1]
  end
  it 'must score a long word' do
    expect(Tile.new('discombobulated').values).must_equal [2, 1, 1, 3, 1, 3, 3, 1, 3, 1, 1, 1, 1, 1, 2]
  end
  it 'must score a word with capitilization' do
    expect(Tile.new('Spoon').values).must_equal [1, 3, 1, 1, 1]
  end
  it 'must score a word in all caps' do
    expect(Tile.new('FORKS').values).must_equal [4, 1, 1, 5, 1]
  end
end

describe Scoring do
  it 'must score a single letter' do
    expect(Tile.new('z').score).must_equal 10
  end

  it 'must score a short word' do
    expect(Tile.new('bananas').score).must_equal 9
  end

  it 'must score a long word' do
    expect(Tile.new('irrevocably').score).must_equal 21
  end

  it 'must score a word with capitilization' do
    expect(Tile.new('OXYPHENBUTAZONE').score).must_equal 41
  end
end

describe Board do
  it 'must double letters' do
    expect(Tile.new('mellifluous').double_letters('lf').score).must_equal 21
  end

  it 'must triple letters' do
    expect(Tile.new('somnambulist').triple_letters('b').score).must_equal 24
  end

  it 'must double words' do
    expect(Tile.new('effervescence').double_word.score).must_equal 52
  end

  it 'must triple words' do
    expect(Tile.new('ineffable').triple_word.score).must_equal 51
  end

  it 'must double and triple letters' do
    expect(Tile.new('petrichor').double_letters('p').triple_letters('h').score).must_equal 27
  end

  it 'must double and triple word' do
    expect(Tile.new('syzygy').double_word.triple_word.score).must_equal 150
  end

  it 'must double and triple word and double and triple letters' do
    expect(Tile.new('oxazepam').double_letters('xp').triple_letters('z').double_word.triple_word.score).must_equal 354
  end
end
