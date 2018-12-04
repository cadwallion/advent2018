require 'set'

ID            = "(?<id>\\d+)"
COORDINATES   = "(?<x>\\d{1,}),(?<y>\\d{1,})"
SIZE          = "(?<width>\\d+)x(?<height>\\d+)"
CLAIM_MATCHER = /##{ID} @ #{COORDINATES}: #{SIZE}/

fabric          = Hash.new { |hsh, key| hsh[key] = [] }
invalid_claims  = Set.new
valid_claims    = Set.new
data = File.read File.join(__dir__, '/../input.txt')

def parse_claim line
  data = line.match(CLAIM_MATCHER).named_captures
  x1 = Integer(data["x"])
  y1 = Integer(data["y"])
  x2 = x1 + Integer(data["width"])
  y2 = y1 + Integer(data["height"])

  { x1: x1, y1: y1, x2: x2, y2: y2, id: data["id"] }
end

coordinates = data.split("\n").map do |line|
  claim = parse_claim line
  (claim[:x1]...claim[:x2]).each do |x|
    (claim[:y1]...claim[:y2]).each do |y|
      coord = "#{x},#{y}"
      id = claim[:id]

      if fabric[coord].length > 0
        overlapped_id = fabric[coord].first

        valid_claims.subtract([id, overlapped_id])
        invalid_claims.merge([id, overlapped_id])
      else
        fabric[coord].push(id)
      end

      valid_claims.add(id) if !invalid_claims.include? id
    end
  end
end

puts "Valid Claim: #{valid_claims.first}"
