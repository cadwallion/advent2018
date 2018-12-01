with open("input.txt", "r") as datafile:
    data = datafile.readlines().map(int, data)
    print sum(data, 0)
