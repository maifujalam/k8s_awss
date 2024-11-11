a=10
b=2

try:
    print(a/b)
    raise ZeroDivisionError
except ArithmeticError:
    print("ArithMetics execption error")
except Exception:
    print("Exception")
finally:
    print("Finally run")
