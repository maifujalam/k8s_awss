def f1(f):
    def wrapper():
        print("Wraper strted")
        f()
        print("Wrapper ended")
    return wrapper

def f2():
    print("Hello")

# f1(f2)() # f2 is function address.When f2 function address passed to f1() it simpley return wrappers address.Now adding()  Calls wrapper function object.
# we can also write above as below:-

# obj=f1(f2)
# print(obj())

@f1
def f3():  # Here using
    print("Hello")

f3() #calling f3
