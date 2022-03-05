opener = File.open(ARGV[0], "r")
incoming_text = opener.read
opener.close
rendered_text = incoming_text
writer = File.open(ARGV[1], "w")
writer.write(rendered_text)
writer.close

puts "Created '#{ARGV[1]}' containing #{incoming_text.bytesize} characters"
