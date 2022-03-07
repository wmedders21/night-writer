require 'pry'
require './lib/translator'
require './lib/braille_dictionary'
require './lib/io'

braille = BrailleDictionary.new
io = IO.new(ARGV)
rendered_text = Translator.translate(io.get_text, braille)
puts io.make_statement
io.make_new_file(rendered_text.formatted)
