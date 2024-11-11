import datetime


def decorator(func):
    def wrapper(*args, **kwargs):
        print("Started wrapping function")
        func(*args, **kwargs)
        with open("log.txt", "a") as f:
            f.write(f"{datetime.datetime.now()}\n {func.__name__} {args} {kwargs}")
        print("Finished wrapping function")

    return wrapper


@decorator
def my_decorator(*args, **kwargs):
    print(*args)
    print(kwargs)


my_decorator(1, 2, 3)
my_decorator({'1': '2'})
