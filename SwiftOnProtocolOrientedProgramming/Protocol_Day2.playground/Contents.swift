// 인간프로토콜
protocol Person {
    var name: String {get set}
    var age: Int { get set }
}

protocol Programmer: Person {
    var language: [String] { get set }
}

var programmers: [Programmer] = []

struct iOSProgrammer: Programmer {
    
    var language: [String]
    
    var name: String
    
    var age: Int

}


struct androidProgrammer: Programmer {
    var language: [String] = []
    
    var name: String
    
    var age: Int
}

var programmer1: Programmer = iOSProgrammer(language: ["swift","objective-C"], name: "aske", age: 39)

var programmer2: Programmer = androidProgrammer(language: ["java","kotlin"], name: "burzum", age: 40)
var programmer3: Programmer = androidProgrammer(language: ["java","kotlin"], name: "yasom", age: 42)
var programmer4: Programmer = androidProgrammer(language: ["java","kotlin"], name: "ggomggg", age: 50)
var programmer5: Programmer = androidProgrammer(language: ["java","kotlin"], name: "sskedd", age: 55)

programmers.append(programmer1)
programmers.append(programmer2)
programmers.append(programmer3)
programmers.append(programmer4)
programmers.append(programmer1)
programmers.append(programmer5)


for prog in programmers where prog is iOSProgrammer {
    print("name: \(prog.name) language : \(prog.language)")
}

for prog in programmers {
    if (prog is iOSProgrammer) {
        print("iOS")
    }else {
        print("android")
    }
}


