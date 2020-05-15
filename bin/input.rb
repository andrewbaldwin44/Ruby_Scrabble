module Input
  def get_input
    @@input = gets.chomp
  end

  def validate_play_mode
    play_mode_answers = ['single player', 'multiplayer', '1', '2']

    until play_mode_answers.include?(@@input)
      puts "Please enter 1 for single player or 2 for multiplayer".red_highlight
      @@input = get_input
    end
    @@input
  end

  def validate_word
    until @@input.match(/^[[:alpha:]]+$/)
      puts "Your word must only contain letters".red_highlight
      @@input = get_input
    end
    @@input
  end
end
