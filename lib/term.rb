class Term
  @@terms = []

  define_method(:initialize) do |word, definition, language|
    @word = [Word.new(word, language)]
    @definition = [Definition.new(definition, language)]
    @id = @@terms.length().+(1)
  end

  define_method(:word) do
    @word
  end

  define_method(:definition) do
    @definition
  end

  define_singleton_method(:all) do
    @@terms
  end

  define_singleton_method(:clear) do
    @@terms = []
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@terms.push(self)
  end

  define_singleton_method(:list) do
    words = []

    @@terms.each() do |term|
      words.push(term.word())
    end
    words
  end

  define_singleton_method(:delete) do |word|
    @@terms.each() do |term|
      if term.word().include?(word)
        @@terms.delete(term)
      end
    end
  end

  define_singleton_method(:search) do |search_word|
    found_word = nil
    @@terms.each() do |term|
      if term.word().include?(search_word)
        found_word = term
      end
    end
    found_word
  end

  define_method(:edit) do |new_definition|
    @definition = new_definition
  end

  define_method(:add_definition) do |added_definition|
    @definition.push(added_definition)
  end

  define_method(:add_word) do |added_word|
    @word.push(added_word)
  end
end
