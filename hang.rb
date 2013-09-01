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

def turn
  print $word

  printWord
  print "\n Bad guesses (only #{$turns_remaining} left): #{$letters_tried} \n"
  
  print "Guess: "
  guess = gets.chomp.to_s
  while($letters_tried.include?(guess) or guess == "")
  print "Guess: "
  guess = gets.chomp.to_s
  end
  
  #checks if the letter guessed is in the word
  if($word.include?(guess))
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
  
 
  gameOverCheck
  
  
end

$keep_playing = true
while($keep_playing)
newGame
print "Do you want to play again? (q to quit or anything else to continue)"
again = gets.chomp
  if(again == 'q') then $keep_playing = false end
end