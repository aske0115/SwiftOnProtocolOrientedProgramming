/*
 확실한 타입을 지정해주지 않고, 프로토콜은 규약만 정의하고 실제 해당 프로토콜을 채택하여 사용하는 쪽에서 데이터 타입을 결정하여 사용할 수 있도록 해주는 연관값.
 */

protocol Queue {
    associatedtype QueueDataType
    mutating func enqueue(item: QueueDataType)
    mutating func dequeue() -> QueueDataType?
    func count() -> Int
}

struct IntQueue: Queue {
    
    var items: [Int] = []
    
    mutating func enqueue(item: Int) {
        items.append(item)
    }
    
    mutating func dequeue() -> Int? {
        if items.count > 0 {
            return items.removeFirst()
        }
        return nil
    }
    
    func count() -> Int {
        return items.count
    }
}

struct StringQueue: Queue {
    
    var items: [String] = []
    
    mutating func enqueue(item: String) {
        items.append(item)
    }
    
    mutating func dequeue() -> String? {
        if items.count > 0 {
            return items.removeFirst()
        }
        return nil
    }
    
    func count() -> Int {
        return items.count
    }
}


var intQueue = IntQueue()
intQueue.enqueue(item: 1)
intQueue.enqueue(item: 2)
intQueue.enqueue(item: 3)

print(intQueue)

while intQueue.count() > 0 {
    print(intQueue.dequeue() ?? -1)
}


var stringQueue = StringQueue()
stringQueue.enqueue(item: "A")
stringQueue.enqueue(item: "B")
stringQueue.enqueue(item: "C")

print(stringQueue)

while stringQueue.count() > 0 {
    print(stringQueue.dequeue() ?? -1)
}
