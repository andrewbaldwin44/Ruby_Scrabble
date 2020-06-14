require 'minitest/autorun'
require 'minitest/pride'

describe 'Scrabble Executable' do
  it 'displays the board and places a word' do
    expected = File.read('assets/golden.txt')
    actual = open('assets/actual.txt', 'w') { |file| file.write(`echo 'banana' | bin/scrabble`.chomp.strip) }
    expect(File.read('assets/actual.txt')).must_equal expected
  end
end
