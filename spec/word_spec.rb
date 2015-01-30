require('rspec')
  
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("#word") do
    it("returns the word") do
      test_word = Word.new("junk", "English")
      expect(test_word.word()).to(eq("junk"))
    end
  end

  describe("#language") do
    it("returns the language") do
      test_word = Word.new("junk", "English")
      expect(test_word.language()).to(eq("English"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word and its language to the array of saved words") do
      test_word = Word.new("junk", "English")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.new("junk", "English").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#add_word') do
    it("adds a new word to the dictionary") do
      test_word = Word.new("junk", "English")
      test_term = Term.new("junk","back alley debris")
      test_term.add_word(test_word)
      expect(test_term.)
end
