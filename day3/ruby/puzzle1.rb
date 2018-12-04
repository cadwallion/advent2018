data = File.read File.join(__dir__, '/../input.txt')

ID            = "(?<id>\\d+)"
COORDINATES   = "(?<x>\\d{1,}),(?<y>\\d{1,})"
SIZE          = "(?<width>\\d+)x(?<height>\\d+)"
CLAIM_MATCHER = /##{ID} @ #{COORDINATES}: #{SIZE}/

fabric = Hash.new 0

coordinates = data.split("\n").map do |line|
  data = line.match(CLAIM_MATCHER).named_captures
  x1 = Integer(data["x"])
  y1 = Integer(data["y"])
  x2 = x1 + Integer(data["width"])
  y2 = y1 + Integer(data["height"])

  (x1...x2).each do |x|
    (y1...y2).each do |y|
      fabric["#{x},#{y}"] += 1
    end
  end
end

overlap = fabric.values.count { |square| square > 1 }
puts "#{overlap} inches of overlap"
