data = File.read File.join(__dir__, '/../input.txt')

ID            = "(?<id>\\d+)"
COORDINATES   = "(?<x>\\d{1,}),(?<y>\\d{1,})"
SIZE          = "(?<width>\\d+)x(?<height>\\d+)"
CLAIM_MATCHER = /##{ID} @ #{COORDINATES}: #{SIZE}/

fabric = Hash.new 0

def parse_claim line
  data = line.match(CLAIM_MATCHER).named_captures
  x1 = Integer(data["x"])
  y1 = Integer(data["y"])
  x2 = x1 + Integer(data["width"])
  y2 = y1 + Integer(data["height"])

  { x1: x1, y1: y1, x2: x2, y2: y2 }
end

coordinates = data.split("\n").map do |line|
  claim = parse_claim line

  (claim[:x1]...claim[:x2]).each do |x|
    (claim[:y1]...claim[:y2]).each do |y|
      fabric["#{x},#{y}"] += 1
    end
  end
end

overlap = fabric.values.count { |square| square > 1 }
puts "#{overlap} inches of overlap"
