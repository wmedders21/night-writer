require 'pry'
require './lib/translator'
require './lib/dictionary'
require './lib/io'

braille = Dictionary.new
io = IO.new(ARGV)
rendered_text = Translator.translate(io.get_text, braille)
io.make_statement
io.make_new_file(rendered_text)
# braille = Dictionary.new
# rendered_text = Translator.translate(read, braille)
# write(rendered_text)
