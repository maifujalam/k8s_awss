def decorator(func):
    def wrapper(*args, **kwargs):
        print("Started wrapping function")
        result = func(*args, **kwargs)
        print("Finished wrapping function")
        return result
    return wrapper

@decorator
def add(a,b):
    return a+b

@decorator
def printer(a,b):
    print(a,b)

print(add(1,2))

printer(1,2)
