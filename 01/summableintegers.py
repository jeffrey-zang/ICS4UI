n = int(input())
  
if n < 0:
  print('no')

elif n % 2 == 1:
  s = int(n/2)
  e = s+1
  print(f'{s} + {e}')

else:
  d = n

  while d % 2 == 0:
    d = d/2

  if d == 1:
    print('no')

  else:
    c = n / d
    s = int(c - int(d/2))
    e = int(c + int(d/2))

    arr = [x for x in range(s, e+1)]
    
    if s < 0:
      i = arr.index(int(abs(arr[0])))
      arr = arr[i+1::]

    arr = [str(x) for x in arr]

    print(' + '.join(arr))