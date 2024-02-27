num = int(input())

top = [int(x) for x in input().split(' ')]
bottom = [int(x) for x in input().split(' ')]

sides = top.count(1) * 3 + bottom.count(1) * 3

for index in range(len(top)):
  if index % 2 == 0 and top[index] == bottom[index] == 1:
    sides -= 2

  if index != len(top) - 1 and top[index] == top[index+1] == 1:
    sides -= 2

for index in range(len(bottom)):
  if index != len(bottom) - 1 and bottom[index] == bottom[index+1] == 1:
    sides -= 2

print(sides)