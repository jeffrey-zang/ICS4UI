c = ''

while True:
  i = input()
  if int(i) == 99999:
    break
  
  l = [int(x) for x in list(i)]
  e = l[0:2]

  if sum(e) % 2 == 0 and e != [0, 0]:
    c = 'right '
  elif sum(e) % 2 != 0:
    c =  'left '
  
  print(c + ''.join(i[2:]))