#read in word file and create an array of words
fname = "words.txt"
$contents = File.open(fname, "r"){ |file| file.readlines }





#variables are global because they are accessed throughout
 $word = $contents[rand($contents.size)]
 $letters_tried = []
 $letters_remaining = ('a'..'z').to_a
 $turns_remaining = 10
 $letters_correct = 0
 $unique_letters = $word.scan(/./).uniq.size

 #starts a new game
def newGame
  $word = $contents[rand($contents.size)]
  $letters_tried = []
  $letters_remaining = ('a'..'z').to_a
  $turns_remaining = 10
  $letters_correct = 0
  $unique_letters = $word.scan(/./).uniq.size
  turn
end

#prints the current status of the game
def printWord
  temp = 0
    print "THE WORD \n"
    #for each letter, check if it has been guessed and print
    #the appropriate character
    while(temp < $word.size-1)
      
      if($letters_tried.include?($word[temp]))
        print "#{$word[temp]} "
      else 
        print "_ "
      end
    temp += 1
    end
end

#checks if the game is over
def gameOverCheck
  if($letters_correct == $unique_letters)
     print "You won!\n"
     printWord
   elsif($letters_correct != $unique_letters and $turns_remaining == 0)
     print "You lose! The word was: #{$word} "
     
   else
     turn
   end
end

#checks if the letter guessed is in the word
def guessLetter

  print "Guess: "
    guess = gets.chomp.to_s.downcase[0]
    while($letters_tried.include?(guess) or guess == "")
    print "Guess: "
    guess = gets.chomp.to_s.downcase[0]
    end
  
  if(guess == "!")
    guessWord
    return false
  elsif($word.include?(guess))
    print "Good guess!"
    $letters_correct += 1
    print "Letters correct: #{$letters_correct} \n"
  else
    print "Sorry, that letter is not in the word."
    $turns_remaining -= 1
  end
  
#removes letter from remaining array and adds it to tried array
$letters_remaining.delete(guess)
$letters_tried.push(guess)
return true
end

def guessWord
  print "What is the word? "
  guess = gets.to_s
  if(guess == $word)
    print "Contratulations! You have guessed correctly! \n"
  else
    print "I'm sorry, your guess was wrong. The correct word was: #{$word}"
  end
end

#The turn function. Most of the other functions are called here.
def turn
  print $word

  printWord
  print "\n Bad guesses (only #{$turns_remaining} left): #{$letters_tried} \n"
  
  
  
  if(guessLetter) then gameOverCheck end
  
  
end

print "Welcome to Hangman: The Movie: The Game. \n If at any time you want to guess the word, enter an exclamation point (!)"

$keep_playing = true
while($keep_playing)
newGame
print "Do you want to play again? (q to quit or anything else to continue)"
again = gets.chomp
  if(again == 'q') then $keep_playing = false end
end