require "./Words"

class Words
  def [](index)
      return contents[index]
   end
end

class Scramble
  
  def initialize(file = "words.txt")
    @words = Words.new(file)
  end
  
end

thing = Words.new
print thing[1]