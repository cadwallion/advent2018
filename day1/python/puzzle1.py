import os

dir_path = os.path.dirname(os.path.realpath(__file__))
with open(dir_path + "/../input.txt", "r") as datafile:
    data = map(int, datafile.readlines())
    print sum(data, 0)
