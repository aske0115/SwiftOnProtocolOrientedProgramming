struct List<T> {
    
    private var items = [T]()
    
    public mutating func add(item: T) {
        items.append(item)
    }
    
    public func getItemAtIndex(index: Int) -> T? {
        if items.count > index {
            return items[index]
        }
        return nil
    }
    
    public subscript(index: Int) -> T? {
        return getItemAtIndex(index: index)
    }
    
    //sequence타입을 가지며 Element가 int인 경우에만 동작.
    public subscript<E : Sequence>(indices: E) -> [T] where E.Iterator.Element == Int {
        var result = [T]()
        for index in indices {
            /*
             swift4 프로토콜지향프로그래밍 예제에는 없는 부분으로 예외처리 추가.
             */
            if items.count <= index {
                break
            }
            result.append(items[index])
        }
        return result
    }
}

var list = List<Int>()
list.add(item: 10)
list.add(item: 20)
list.add(item: 30)

print(list[0...4])
