data = File.read File.join(__dir__, "input.txt")
parsed_data = data.split("\n").map { |n| n.gsub("+", "").to_i }
starting_frequency = 0
found_frequencies = []

def cycle_frequencies starting_frequency, found_frequencies, frequency_map
  end_frequency = frequency_map.inject starting_frequency do |current_frequency, shift|
    new_frequency = current_frequency + shift
    if found_frequencies.include? new_frequency
      return new_frequency
    else
      found_frequencies << new_frequency
    end

    new_frequency
  end

  cycle_frequencies end_frequency, found_frequencies, frequency_map
end

matched_frequency = cycle_frequencies starting_frequency, found_frequencies, parsed_data
puts matched_frequency
