//String  타입을 확장하여 doubleString이라는 computed Property를 확장했다.
extension String {
    var doubleString: String {
        get {
            self + self
        }
    }
}


let add: String = "Aske"
print(add.doubleString)


//Int타입을 확장하여 타입메소드인 turnNegative 메소드를 확장
extension Int {
    static func turnNegative(value: Int) -> Int {
        return -value
    }
}


print(Int.turnNegative(value: 100))


//Double 타입을 확장하여 인스턴스메소드인 turnInt를 확장
extension Double {
    func turnInt() -> Int {
        return Int(self)
    }
}

let turnInt: Double = 14.02312
print(turnInt.turnInt())


//string 타입을 확장하여 subscript 확장.
extension String {
    subscript(idx: Int) -> String? {
        get {
            guard (0..<count).contains(idx) else { return nil }
            let target = index(startIndex, offsetBy: idx)
            return String(self[target])
        }
    }
}


print(add[2])


extension Int {
    func factorial() -> Int {
        var answer = 1
        for i in (1...self).reversed() {
            answer *= i
        }
        
        return answer
    }
}


print(5.factorial())

