require("rspec")
require("term")

describe("Term") do
  before() do
    Term.clear()
  end

  describe("#word") do
    it("returns the term's word") do
      test_term = Term.new("carrot", "orange thing", "English")
      expect(test_term.word()).to(eq(["carrot"]))
    end
  end

  describe("#definition") do
    it("returns the term's definition") do
      test_term = Term.new("carrot", "orange thing")
      expect(test_term.definition()).to(eq(["orange thing"]))
    end
    it("returns multiple definitions for one word") do
      test_term = Term.new("carrot", "orange thing")
      test_term.add_definition("a vegetable")
      expect(test_term.definition()).to(eq(["orange thing", "a vegetable"]))
    end
  end

  describe("#save") do
    it("adds a term to the array of saved terms") do
      test_term = Term.new("carrot", "orange thing")
      test_term.save()
      expect(Term.all()).to(eq([test_term]))
    end
  end

  describe(".clear") do
    it("clears out terms") do
      Term.new("carrot", "orange thing").save()
      Term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Term.all()).to(eq([]))
    end
  end

  describe(".list") do
    it("returns an array of all words") do
      Term.new("carrot", "orange thing").save()
      Term.new("banana", "yellow thing").save()
      expect(Term.list()).to(eq([["carrot"], ["banana"]]))
    end
  end

  describe(".delete") do
    it("deletes a word and its definition") do
      Term.new("carrot", "orange thing").save()
      Term.new("banana", "yellow thing").save()
      Term.delete("banana")
      expect(Term.list()).to(eq([["carrot"]]))
    end
  end

  describe(".search") do
    it("searches for a word and returns the term") do
      search_term = Term.new("carrot", "orange thing")
      search_term.save()
      search_term2 = Term.new("banana", "yellow thing")
      search_term2.save()
      expect(Term.search("carrot")).to(eq(search_term))
    end

    it("searches for a word and returns the term") do
      Term.new("carrot", "orange thing").save()
      Term.new("banana", "yellow thing").save()
      expect(Term.search("orange")).to(eq(nil))
    end
  end

  describe("#edit") do
    it("edits a word's definition") do
      test_term = Term.new("carrot", "orange thing")
      test_term.edit("an orange vegetable")
      expect(test_term.definition()).to(eq("an orange vegetable"))
    end
  end

  describe("#add_definition") do
    it("adds a second definition to the term") do
      test_term = Term.new("carrot", "orange thing")
      test_term.add_definition("a vegetable")
      expect(test_term.definition()).to(eq(["orange thing", "a vegetable"]))
    end
  end

  describe("#add_word") do
    it("adds a second word to the term") do
      test_term = Term.new("carrot", "orange thing")
      test_term.add_word("carotte")
      expect(test_term.word()).to(eq(["carrot", "carotte"]))
    end
  end


end
