def myFun(arg1, *argv):
    print("First argument :", arg1)
    print("Second argument :", argv)
    print(type(argv))


myFun('Hello', 'Welcome', 'to', 'GeeksforGeeks')
