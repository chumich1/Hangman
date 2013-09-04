
require "./hang"
require "test/unit"

class TestFileReading < Test::Unit::TestCase

  #tests the random word picking by checking if repeated calls to the choseWord
  #function returns a single word significantly more than it statistically should
  def test_random
    
    
    temp = 0
    count = 0
    game = HangMan.new
    thisWord = game.choseWord()
    
    while(temp < 100)
      if(game.choseWord() == thisWord)
        count += 1
      end
      temp += 1
    end
    
    
    assert_operator(25, :> ,count)
    
    temp = 0
       count = 0
       game = HangMan.new
       thisWord = game.choseWord()
       
       while(temp < 200)
         if(game.choseWord() == thisWord)
           count += 1
         end
         temp += 1
       end
       
       print "#{count} \n"
       assert_operator(50, :> ,count)
    
  end

  #test that the file is read into the contents variable
  def test_file
    assert_not_nil(true, HangMan.new.contents)
  end
  
end