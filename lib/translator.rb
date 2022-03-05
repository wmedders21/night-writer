require 'pry'
class Translator
  attr_reader :text, :dictionary
  def initialize(text, dictionary)
    @text = text
    @dictionary = dictionary
  end

  def find_register(character)
    @dictionary.character_hash.map do |k,v|
      k if v.any?(character)
    end.compact.first
  end

  def find_character_index(character)
    @dictionary.character_hash.map do |k,v|
      v if v.any?(character)
    end.compact.first.index(character)
  end
end
