def f1(f):
    def wrapper():
        print("Started dec")
        f()
        print("Finished dec")
    return wrapper

# def f2():
#     print("Hello")

# Type-1 of calling wrapper
# ob=f1(f2)
# ob()

#Type-2  of calling wrapper
# f1(f2)() # Calling wrapper function/

#Type-3 is Decorators
@f1    # obj=f1(f3)
def f3():
    print("Hello-2")

#Now call f3 as below
f3()
