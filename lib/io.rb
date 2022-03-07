class IO
  def initialize(arg_array)
    @arg_array = arg_array
  end

  def get_text
    opener = File.open(@arg_array[0], 'r')
    incoming_text = opener.read.downcase
    opener.close
    incoming_text
  end
end


# puts "Created '#{ARGV[1]}' containing #{incoming_text.length} characters"
