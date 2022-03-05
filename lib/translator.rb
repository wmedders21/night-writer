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

  def make_binary(character)
    "%04b" % find_character_index(character)
  end

  def add_register(character)
    register = find_register(character)
    if register == :register1
      register = "11"
    elsif register == :register2
      register = "01"
    elsif register == :register3
      register = "00"
    elsif register == :register4
      register = "10"
    end
    make_binary(character).insert(4, register)
  end

  def braille_strings(character)
    add_register(character).gsub("1", ".")
  end
end
