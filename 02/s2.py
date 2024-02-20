init = int(input())
nums = input().split(' ')
nums = [int(x) for x in nums]

def calcav(l):
  av = 0

  for index in range(len((l))):
    if index == len(l) - index - 1 or index + 1 > len(l) - index - 1:
      break

    ad = abs(l[index] - l[len(l) - index -1])
    av += ad

  return av

def chunk(arr, size):
  final = []
  for i in range(len(arr)):
    if i+size == len(arr) + 1:
      break
    final.append(arr[i:i+size])
  return final

f = []

for i in range(len(nums)):
  cur = -1

  for j in chunk(nums, i+1):
    r = calcav(j)
    if cur == -1:
      cur = r
    if cur > r:
      cur = r

  f.append(str(cur))

print(' '.join(f))