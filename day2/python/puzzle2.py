import os

def compare_distance(a, b):
    distance = 0
    for idx in range(len(a)):
        if a[idx] != b[idx]:
            distance += 1

    return distance

def common_letters(a, b):
    return [a[idx] for idx in range(len(a)) if a[idx] == b[idx]]

dir_path = os.path.dirname(os.path.realpath(__file__))
data = []

with open(dir_path + "/../input.txt", "r") as datafile:
    for line in datafile:
        data.append(line.rstrip("\n"))

for idx1 in range(0, len(data)-2):
    for idx2 in range(idx1+1, len(data)-1):
        if compare_distance(data[idx1], data[idx2]) == 1:
            in_common = "".join(common_letters(data[idx1], data[idx2]))
            print(f"Boxes with distance of 1: {data[idx1]} and {data[idx2]}")
            print(f"Common letters: {in_common}")
