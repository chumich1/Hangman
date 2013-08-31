#read in word file and create an array of words
fname = "words.txt"
$contents = File.open(fname, "r"){ |file| file.readlines }



#puts contents[rand(contents.size)]


 $word = $contents[rand($contents.size)]
 $letters_tried = []
 $letters_remaining = ('a'..'z').to_a
 $turns_remaining = 10
 $letters_correct = 0

def newGame
  $word = $contents[rand($contents.size)]
  $letters_tried = []
  $letters_remaining = ('a'..'z').to_a
  $turns_remaining = 10
  $letters_correct = 0
  turn
end

def printWord
  temp = 0
    print "THE WORD \n"
    while(temp < $word.size-1)
      
      if($letters_tried.include?($word[temp]))
        print "#{$word[temp]} "
      else 
        print "_ "
      end
    temp += 1
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
  if($word.include?(guess))
    print "Good guess!"
    $letters_correct += 1
    print "Letters correct: #{$letters_correct} \n"
  else
    print "Sorry, that letter is not in the word."
    $turns_remaining -= 1
  end
  
  $letters_remaining.delete(guess)
  $letters_tried.push(guess)
  
  if($letters_correct == $word.scan(/./).uniq.size)
    print "You won!"
    printWord
  elsif($letters_correct != $word.scan(/./).uniq.size and $turns_remaining == 0)
    print "You lose! The word was: #{$word} "
    
  else
    turn
  end
  
  
  
end


newGame