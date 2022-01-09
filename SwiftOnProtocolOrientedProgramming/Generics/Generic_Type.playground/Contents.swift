struct Stack<T> {
    private var items:[T] = []
    
    mutating func push(item:T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        if let item = items.last {
            items.removeLast()
            return item
        }
        return nil
    }
    
    func printStack() {
        items.reversed().forEach {
            print($0)
        }
    }
}


var intStack = Stack<Int>()
intStack.pop()
intStack.push(item: 1)
intStack.push(item: 2)
intStack.push(item: 3)
intStack.push(item: 4)
intStack.printStack()
print(intStack.pop())
print(intStack.pop())
intStack.printStack()

var stringStack = Stack<String>()
stringStack.pop()
stringStack.push(item: "a")
stringStack.push(item: "s")
stringStack.push(item: "k")
stringStack.push(item: "e")
stringStack.printStack()
print(stringStack.pop())
print(stringStack.pop())
stringStack.printStack()
