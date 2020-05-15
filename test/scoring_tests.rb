require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/board'
require_relative '../lib/tile'
require_relative '../lib/scoring'
require_relative '../lib/validator'

describe Scoring do
  Tile.include Scoring
  Tile.include Validate
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
