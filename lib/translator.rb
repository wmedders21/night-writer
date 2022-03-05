require 'pry'
class Translator
  attr_reader :text, :dictionary
  def initialize(text, dictionary)
    @text = text
    @dictionary = dictionary
  end

  def find_register(character)
    @dictionary.character_hash.map { |k,v| k if v.any?(character) }.compact.first
  end
end
