require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'

describe Board do
  Test_Board = Board.new

  it 'must score letters' do
    expect(Test_Board.new_letters('orchard').score).must_equal 13
  end

  it 'must double letters' do
    actual = Test_Board.new_letters('mellifluous').multiply('lf', 2).score
    expect(actual).must_equal 21
  end

  it 'must triple letters' do
    actual = Test_Board.new_letters('somnambulist').multiply('b', 3).score
    expect(actual).must_equal 24
  end

  it 'must double words' do
    actual = Test_Board.new_letters('effervescence').word_times(2).score
    expect(actual).must_equal 52
  end

  it 'must triple words' do
    actual = Test_Board.new_letters('ineffable').word_times(3).score
    expect(actual).must_equal 51
  end

  it 'must double and triple letters' do
    actual = Test_Board.new_letters('petrichor').multiply('p', 2)
                  .multiply('h', 3).score
    expect(actual).must_equal 27
  end

  it 'must double and triple word' do
    actual = Test_Board.new_letters('defenestration').word_times(2)
                  .word_times(3).score
    expect(actual).must_equal 108
  end

  it 'must double and triple word and double and triple letters' do
    actual = Test_Board.new_letters('oxazepam').multiply('xp', 2)
                  .multiply('z', 3).word_times(2).word_times(3).score
    expect(actual).must_equal 354
  end

  it 'must multiply a word with blanks' do
    actual = Test_Board.new_letters('ram unctious').multiply('m', 2)
                  .word_times(2).word_times(3).score
    expect(actual).must_equal 108
  end
end
