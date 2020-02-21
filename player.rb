class Player
  attr_reader :code

  def initialize
    @guess=nil
  end

  def guess
    @guess = gets.chomp
    until @guess.length == 4 && @guess[/^[0-6]+$/]
      puts "Invalid code. It must contain 4 digits from 1 to 6."
      @guess = gets.chomp
    end
    return @guess.split('')
  end
end