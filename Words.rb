#Andrew Chumich
class Words
  def initialize(file)
  fname = file
  @contents = File.open(fname, "r"){ |file| file.readlines }
   end
  
   def choseWord
     @word = @contents[rand(@contents.size)]
     return @word
   end
end