
try:
    a = int(input())
    assert a>0;  # If <0 it will throw Assertion Error.
    b = 10
    print(b/a)
except ZeroDivisionError:
    print("Division by zero")
except Exception as e:
    print("Something went wrong",e)
