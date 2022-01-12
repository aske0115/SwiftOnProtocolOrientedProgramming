fileprivate class BackendQueue<T> {
    private var items = [T]()
    
    public func addItem(item: T) {
        items.append(item)
    }
    
    public func getItem() -> T? {
        if items.count > 0 {
            return items.remove(at:0)
        }
        return nil
    }
    
    public func count() -> Int {
        return items.count
    }
    
    public init() {}
    private init(_ items:[T]) {
        self.items = items
    }
    
    public func copy() -> BackendQueue<T> {
        return BackendQueue<T>(items)
    }
}


struct Queue {
    private var internalQueue = BackendQueue<Int>()
    
    public mutating func addItem(item: Int) {
        checkUniqulyReferencedInternalQueue()
        internalQueue.addItem(item: item)
    }
    
    public mutating func getItem() -> Int? {
        checkUniqulyReferencedInternalQueue()
        return internalQueue.getItem()
    }
    
    public func count() -> Int {
        return internalQueue.count()
    }
    
    
    mutating private func checkUniqulyReferencedInternalQueue() {
        if !isKnownUniquelyReferenced(&internalQueue) {
            internalQueue = internalQueue.copy()
            print("Make copy of internalQueue")
        } else {
            print("not making a copy of internalQueue")
        }
    }
    
    mutating public func uniquelyReferenced() -> Bool {
        return isKnownUniquelyReferenced(&internalQueue)
    }
}


var queue = Queue()
queue.addItem(item: 10)

//queue를참조하는 곳이 없기때문에 true이며 별도의 copy를 하지 않는다..
print(queue.uniquelyReferenced())

var queue2 = queue
//queue를참조하는 곳이 있기때문에 false 이지만 값을 변경하지 않기떄문에 복사가 이루어지지는 않는다.

print(queue.uniquelyReferenced())
print(queue2.uniquelyReferenced())

//참조하는 변수에서 값을 변경하게되면 그제서야 copy를 통하여 값 복사가 이루어진다.
queue2.addItem(item: 20)

//따라서 이후로는 queue와 queue2는 별도의 값을 가지게된다.
print(queue.count())
print(queue2.count())
