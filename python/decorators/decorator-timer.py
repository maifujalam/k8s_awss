import time

def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        func(*args, **kwargs)
        end = time.time()
        print("Program executed in: ",end - start,"seconds")
    return wrapper

@timer
def sleeper():
    time.sleep(1)

sleeper()
