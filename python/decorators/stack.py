s=[]

def push(a):
    s.append(a)

def pop():
    #return s.pop()
    del s[-1] # we can use both.

s.append(1)
s.append(2)
s.append(4)
print(s)
s.pop()
s.pop()
print(s)
