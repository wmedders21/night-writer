module Readable
  def read
    opener = File.open(ARGV[0], 'r')
    incoming_text = opener.read.downcase
    puts "Created '#{ARGV[1]}' containing #{incoming_text.length} characters"
    opener.close
    incoming_text
  end
end
