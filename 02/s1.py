num = int(input())

first = [int(x) for x in input().split(' ')]
second = [int(x) for x in input().split(' ')]

sides = first.count(1) * 3 + second.count(1) * 3

for index, value in enumerate(first):
  if index % 2 == 0 and first[index] == second[index] == 1:
    sides -= 2

  if index != len(first) - 1 and first[index] == first[index+1] == 1:
    sides -= 2

for index, value in enumerate(second):
  if index != len(second) - 1 and second[index] == second[index+1] == 1:
    sides -= 2

print(sides)