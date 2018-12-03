data = File.read File.join(__dir__, '/../input.txt')


def compare_distance a, b
  (0..a.length).inject(0) do |distance, idx|
    distance += 1 if a[idx] != b[idx]
    distance
  end
end

def common_letters a, b
  (0..a.length).inject([]) do |letters, idx|
    letters.push(a[idx]) if a[idx] == b[idx]
    letters
  end
end

boxes = data.split("\n")
box_count = boxes.length

(0..box_count-2).each do |idx1|
  (idx1+1..box_count-1).each do |idx2|
    if compare_distance(boxes[idx1], boxes[idx2]) == 1
      in_common = common_letters boxes[idx1], boxes[idx2]

      puts "Boxes with distance of 1: #{boxes[idx1]} and #{boxes[idx2]}"
      puts "Common letters: #{in_common.join('')}"
      exit
    end
  end
end
