import sys

for line in sys.stdin:

    if line[0] == "\n": print("")

    for c in line:
        if c == 'x': print("1", end='')
        if c == '.': print("0", end='')
