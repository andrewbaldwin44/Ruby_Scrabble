require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/exceptions'

describe TileError do
  it 'must raise an error with a custom message' do
    exception = TileError.new('Custom error message')
    expect(exception.message).must_equal('Custom error message')
  end
end
