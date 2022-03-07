require './lib/translator'
class ToLatin < Translator
  def collect_rows
    @text.split("\n")
  end

  def parse_rows
    array = []
    all_rows = collect_rows
    until all_rows == []
      rows = all_rows[0..2]
      (rows[0].length / 2).times do
        array << rows.map { |row| row.slice!(0..1) }.join
      end
      all_rows.delete('')
    end
    array
  end

  def convert_letters
    parse_rows.map { |letter| @dictionary.character_hash[letter] }
  end

  def formatted
    convert_letters.join
  end
end
