require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'

describe Board do
  it 'must double letters' do
    expect(Board.new('mellifluous').multiply('lf', 2).score).must_equal 21
  end

  it 'must triple letters' do
    expect(Board.new('somnambulist').multiply('b', 3).score).must_equal 24
  end

  it 'must double words' do
    expect(Board.new('effervescence').word_times(2).score).must_equal 52
  end

  it 'must triple words' do
    expect(Board.new('ineffable').word_times(3).score).must_equal 51
  end

  it 'must double and triple letters' do
    expect(Board.new('petrichor').multiply('p', 2).multiply('h', 3).score).must_equal 27
  end

  it 'must double and triple word' do
    expect(Board.new('defenestration').word_times(2).word_times(3).score).must_equal 108
  end

  it 'must double and triple word and double and triple letters' do
    expect(Board.new('oxazepam').multiply('xp', 2).multiply('z', 3).word_times(2).word_times(3).score).must_equal 354
  end

  it 'must multiply a word with blanks' do
    expect(Board.new('ram unctious').multiply('m', 2).word_times(2).word_times(3).score).must_equal 108
  end
end
