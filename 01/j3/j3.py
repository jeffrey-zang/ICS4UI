e = list(input())

i = 0
while i < len(e):
  print(e, i)
  f = False
  if e[-1]:
    if e[i].isalpha() and e[i-1].isnumeric() or i+1 == len(e):
      thing = e[0:i]
      for j in range(len(thing)):
        if thing[j] in ['-', '+']:
          print(thing)
          st = ''
          st += ''.join(thing[0:j])
          st += ' '
          if thing[j] == '+':
            st += 'tighten'
          if thing[j] == '-':
            st += 'loosen'
          st += ' '
          st += ''.join(thing[j+1::])
          print(st)
          e = e[i::]
          i = 0
          f = True
  if f:
    i = 0
  else: 
    i += 1