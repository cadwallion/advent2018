import os

dir_path = os.path.dirname(os.path.realpath(__file__))
data = []

with open(dir_path + "/../input.txt", "r") as datafile:
    for line in datafile:
        data.append(line)

doubles = 0
triples = 0

for box in data:
    processed = {}
    has_triple = False
    has_double = False
    for char in box:
        if char not in processed.keys():
            processed[char] = box.count(char)

            if processed[char] == 3:
                has_triple = True
            elif processed[char] == 2:
                has_double = True
    if has_triple:
        triples += 1
    if has_double:
        doubles += 1

print(f"Doubles: {doubles}")
print(f"Triples: {triples}")
print(f"Checksum: {doubles * triples}")
