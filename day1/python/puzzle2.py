import os

def calibrate(starting_frequency, found_frequencies, frequency_map):
    current_frequency = starting_frequency
    for shift in frequency_map:
        current_frequency = current_frequency + shift
        if current_frequency in found_frequencies:
            return current_frequency
        else:
            found_frequencies.append(current_frequency)

    return calibrate(current_frequency, found_frequencies, frequency_map)

dir_path = os.path.dirname(os.path.realpath(__file__))
with open(dir_path + "/../input.txt", "r") as datafile:
    data = map(int, datafile.readlines())

    calibrated_frequency = calibrate(0, [], data)
    print calibrated_frequency
