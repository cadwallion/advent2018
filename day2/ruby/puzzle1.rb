data = File.read File.join(__dir__, '/../input.txt')


doubles, triples = data.split("\n").inject([0,0]) do |(doubles, triples), box|
  letters = box.chars
  processed = {}
  has_triple = false
  has_double = false

  letters.each do |char|
    unless processed.has_key? char
      letter_count = letters.count { |l| l == char }

      if letter_count == 3
        has_triple = true
      elsif letter_count == 2
        has_double = true
      end
    end
  end

  doubles += 1 if has_double
  triples += 1 if has_triple
  [doubles, triples]
end

puts "Doubles: #{doubles}"
puts "Triples: #{triples}"
puts "Checksum: #{doubles * triples}"
