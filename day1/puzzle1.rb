data = File.read File.join(__dir__, 'input.txt')
puts data.split("\n").map{ |n| n.gsub('+', '').to_i }.sum
