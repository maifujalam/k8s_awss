def f(*args,**kwargs):
    print(args)
    print(kwargs)


a1=('a','b','c','d')
a2={'a':'b','c':'d'}

f(*a1)
f(**a2)
