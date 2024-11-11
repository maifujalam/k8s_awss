class Stack:
    def __init__(self):
        self.stack = []

    def push(self, item):
        self.stack.append(item)

    def pop(self):
        return self.stack.pop()

class AddStack(Stack):
    def __init__(self):
        Stack.__init__(self)
        self.__sum=0

    def add(self):
        for item in self.stack:
            self.__sum+=item
        return sum

if __name__ == "__main__":
    s = Stack()
    s.push(1)
    print(s.stack)
    s.pop()
    print(s.stack)

    s1=AddStack()
    print(s1.add())

