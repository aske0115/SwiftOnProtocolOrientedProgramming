//제네릭 함수

//Non Generic
func swapInt(a: inout Int, b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

func swapString(a: inout String, b: inout String) {
    let tmp = a
    a = b
    b = tmp
}

func swapDouble(a: inout Double, b: inout Double) {
    let tmp = a
    a = b
    b = tmp
}

/*
 타입이 추가되면 중복된 함수가 늘어나고 코드도 중복된다.
 제네릭은 이러한 문제를 말끔히 해결해준다.
 */

func swap<T>(a: inout T, b: inout T) {
    let tmp = a
    a = b
    b = tmp
}



var num1 = 1
var num2 = 2

var str1 = "1"
var str2 = "2"

var db1 = 1.0
var db2 = 2.0

print(num1)
print(num2)

swap(&num1, &num2)

print(num1)
print(num2)

print(str1)
print(str2)


swap(&str1, &str2)

print(str1)
print(str2)

print(db1)
print(db2)

swap(&db1, &db2)

print(db1)
print(db2)
//print(swap(&"asds", &"gggg"))




//func genericEqual<T>(a: T, b: T) -> Bool {
//    return a == b
//}


//genericEqual(a: 10, b: 10) // error
//타입 제약.. T는 comparable 프로토콜을 따라야 비교연산이 가능
func genericEquals<T: Comparable>(a: T, b: T) -> Bool {
    return a == b
}

genericEquals(a: 10, b: 10)


//여러가지의 제네릭을 선언하고 각 제네릭이 따라야하는 클래스 혹은 프로토콜을 제약한다.
func genericClassProtocol<T: Codable,E: Hashable>(a: T, b: E) {
    print("blahblah")
}


