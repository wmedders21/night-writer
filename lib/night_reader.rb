require 'pry'
require './lib/to_latin'
require './lib/latin'
require './lib/readable'
require './lib/writeable'

include Readable
include Writeable

latin = Latin.new
translated = ToLatin.new(read, latin)
rendered_text = translated.formatted
write(rendered_text)
