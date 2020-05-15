require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'
require_relative '../lib/tile'
require_relative '../lib/scoring'
require_relative '../lib/validator'

describe Board do
  Tile.include Board
  Tile.include Scoring
  Tile.include Validate
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
    expect(Tile.new('defenestration').double_word.triple_word.score).must_equal 108
  end

  it 'must double and triple word and double and triple letters' do
    expect(Tile.new('oxazepam').double_letters('xp').triple_letters('z').double_word.triple_word.score).must_equal 354
  end

  it 'must multiply a word with blanks' do
    expect(Tile.new('ram unctious').double_letters('m').double_word.triple_word.score).must_equal 108
  end
end
