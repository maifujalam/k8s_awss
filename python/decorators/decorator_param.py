def decorator(func):
    def wrapper(*args, **kwargs):
        print("Started decorator")
        func(*args, **kwargs)
        print("Finished decorator")
    return wrapper

@decorator
def f1(*args,**kwargs):
    print(*args,**kwargs)
    # print(**kwargs)

f1("Arg","Arg2",{'b':"fd"})
