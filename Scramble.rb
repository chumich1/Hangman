#Andrew Chumich
require "./Words"

class Words
  def [](index)
      return contents[index]
   end
   
   def size
     return contents.size
   end
end

class Scramble
  
  def initialize(file = "words.txt")
    @words = Words.new(file)
  end
  
  def scrambleTurn(word)
    scrambled_word = word.chomp.split("").shuffle
    scrambled_word.each {|x| print x}
    print "\n"
    
  end
  
  def play
    
    puts @words.size
    correct = 0
    incorrect = 0

    temp = 0
    while(temp < @words.size)
      scrambleTurn(@words[temp])
      print "What is the word? \n"
      guess = gets.chomp.downcase
      
      if(guess == @words[temp].chomp.downcase)
        puts "Correct!"
        correct += 1
      else
        puts "Incorrect..."
        incorrect += 1
      end
      
      puts "Do you want ot continue? (Y/N)"
      continue = gets.chomp.downcase
      
      if(continue == 'n')
        temp = @words.size
      end
      
      temp += 1
    end
    
    
    puts "You have finished the game!"
    puts "Score: "
    puts "Correct: #{correct}"
    puts "Incorrect: #{incorrect}"

    
   
    
  end
  
end

thing = Scramble.new
thing.play