protocol QueueType {
    associatedtype T
    var items: [T] { get set }
    mutating func add(item: T)
}

/* 특정 타입을 제공하는 프로토콜 채택
   - 자료형마다 다른 struct나 class를 생성해주어야 한다.
    ex: IntQueue, StringQueue, DoubleQueue 등...
 */

struct IntQueue: QueueType {
    var items: [Int] = []
    mutating func add(item: Int) {
        self.items.append(item)
    }
}

/* 제네릭 타입을 제공하는 프로토콜 채택
 - 생성할때 제네릭에 자료형을 선언하여 생성하면 해당 자료형을 가진 Queue구조체가 생성된다.
 ex: Queue<Int>()
 ex: Queue<String>()
 */

struct Queue<T>: QueueType {
    var items: [T] = []
    mutating func add(item: T) {
        self.items.append(item)
    }
}
