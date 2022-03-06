require 'pry'
require './lib/translator'
require './lib/dictionary'
require './lib/readable'
require './lib/writeable'

include Readable
include Writeable

# braille = Dictionary.new
rendered_text = 'yay'
write(rendered_text)
