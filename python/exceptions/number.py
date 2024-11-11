b=(input("Enter a number:"))


def divide(a, b):
    try:
        print(a/int(b))
    except (ZeroDivisionError,ValueError):
        print("Zero Division Error")
    except ArithmeticError:
        print("Operation Failed")
    except:
        print("Other Error")



if __name__ == '__main__':
    a=10
    divide(a,b)
