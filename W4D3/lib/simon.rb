class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = [] 
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end
  private
  def take_turn
    show_sequence
    require_sequence
    if !@game_over 
      round_success_message
      @sequence_length += 1
    end
  end

  def add_random_color
    COLORS.sample
    seq << COLORS.sample
    puts
    puts seq
    puts "-----"
    puts
  end
  
  def show_sequence
    add_random_color
  end

  def quit_game_early
    puts
    @game_over = true
    puts "Exiting Game.."
  end

  def require_sequence
    user_input = []
    sequence_length.times do 
      user_input << gets.chomp
      if user_input.include?("q")
        quit_game_early
        return
      end
    end

    puts
    seq.each_with_index do|ele,i| 
      if ele != user_input[i]
        puts "whoops!"
        @game_over = true
        break
      end
    end
  end
  
  def round_success_message
    puts "Good work"
    puts
  end

  def game_over_message
    puts "Better luck next time"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = Array.new
  end
end

simon = Simon.new
puts "Lets Play Simon!"
puts "Repeat back the new Sequence once color at a time"
puts "Press q to quit"
simon.play