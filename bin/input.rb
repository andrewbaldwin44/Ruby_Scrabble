module UserInput
  def self.get_play_mode
    play_mode = gets.chomp

    unless play_mode == '1' || play_mode == '2' || \
            play_mode == 'single player' || play_mode == 'multiplayer'
      puts "Please enter 1 for single player or 2 for multiplayer".red_highlight
      play_mode = get_play_mode
    end
    play_mode
  end

  def self.get_user_word
    word = gets.chomp

    unless word.match(/[[:alpha:]]/)
      puts "Please enter a valid word".red_highlight
      word = get_user_word
    end
    word
  end
end
