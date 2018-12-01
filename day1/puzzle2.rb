data = File.read File.join(__dir__, "input.txt")
parsed_data = data.split("\n").map { |n| n.gsub("+", "").to_i }
starting_frequency = 0
found_frequencies = []

def cycle_frequencies starting_frequency, found_frequencies, frequency_map
  frequency_map.inject(starting_frequency) do |current_frequency, shift|
    new_frequency = current_frequency + shift
    if found_frequencies.include? new_frequency
      puts new_frequency
      exit
    else
      found_frequencies << new_frequency
    end

    new_frequency
  end
end


loop do
  starting_frequency = cycle_frequencies starting_frequency, found_frequencies, parsed_data
end
