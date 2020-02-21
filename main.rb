class Mastermind
  def initialize
    @code = "#{rand(6)}#{rand(6)}#{rand(6)}#{rand(6)}"
    @player = Player.new
  end

  def rules
   puts ""
   puts "Welcome to Mastermind".bold.cyan
   puts ""
   puts "RULES".bold.italic.cyan
   puts ""
   puts "1 - You have to break a secret code in order to win the game."
   puts "2 - You have 4 rounds to crack the code. In each round you will input what you think is the secret code."
   puts "3 - After submitting your code. The computer will try to help you to crack the code by giving hints as to correct digits, incorrect digits and correct digits that are in the incorrect position."
   puts ""
   puts ">>> If you get a digit absolutely correct, the digit will be coloured #{"green".green}.",
     ">>> If you get a digit correct but in the wrong position, the digit will be coloured #{"yellow".yellow}.",
     ">>> If you get the digit wrong, the digit will be coloured #{"red".red}."
   puts ""
   puts "Example".bold.italic.cyan
   puts ""
   puts "If the secret code is: \n1234 \nand your guess was:\n1524 \nyou will see the following result: \n#{"1".green+"5".red+"2".yellow+"4".green}"
  end
  def intro
   puts ""
   puts "#{"New".cyan} game!"
   puts "#{"Do".cyan} you want to #{"decode(1)".cyan} or to #{"code(2)".cyan}"
  end
  def type
   intro
   choice = gets.chomp
   if choice == "1"
    round
   elsif choice == "2"
    return
   else
    puts "#{"Please".cyan} enter '1' or '2'"
    type
   end
  end
  def round
   @rounds = 4
   puts "New code has been created!".cyan
   until @rounds == 0 || self.won?
    puts "Guesses left: #{@rounds}"
    puts "Guess the code"
    @guess = @player.guess
    hint
    @rounds -= 1
   end
   puts won? ? "You've won!" : "You've lost!"
   outro
  end
  def hint
    @guess.each_with_index do |e, i|
     if e == @code.split('')[i]
      puts "#{e.green}"
    elsif e != @code.split('')[i] && !@code.include?(e)
      puts "#{e.red}"
     elsif @code.include?(e)
      puts "#{e.yellow}"
     end
    end
  end
  def outro
   puts "Wanna play again?"
   puts "Y/N"
   playAgain = gets.strip
   play if playAgain.upcase == "Y"
  end
  def won?
    @code.split('') == @guess
  end

  def play
   rules
   type
  end
end