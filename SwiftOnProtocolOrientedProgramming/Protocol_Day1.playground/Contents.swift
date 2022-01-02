//
//  Protocol_Day1.swift
//  SwiftOnProtocolOrientedProgramming
//
//  Created by GeunHwa Lee on 2021/12/26.
//

struct Home {
    var address: String
    var myOwn: Bool
}

protocol MyProtocol {
    //프로토콜 정의
    //프로토콜 요구사항
    var myFavorite: String { get set }
    var myHome: Home { get }
}

protocol YourProtocol : CustomStringConvertible{
    //프로토콜 정의 (CustomStringContertible 프로토콜 상속받아서 description 프로퍼티 사용.
    var description: String { get }
}

protocol OurProtocol {
    //프로토콜 정의
}

//프로토콜 채택
struct MyStruct: MyProtocol, YourProtocol, OurProtocol {
    var description: String {
        return "MyFavorite is \(myFavorite) and my home address is \(myHome.address)"
    }
    
    var myFavorite: String
    
    var myHome: Home = {
        let myHomes = Home(address: "용인 그 어딘가", myOwn: true)
        return myHomes
    }()
}

let myStruct = MyStruct(myFavorite: "Soccer")
print(myStruct.description)


struct MyProtocolOnlyStruct: MyProtocol {
    var myFavorite: String
    
    var myHome: Home = {
        let myHomes = Home(address: "서울한복판", myOwn: true)
        return myHomes
    }()
}

let myProtocolOnlyStruct = MyProtocolOnlyStruct(myFavorite: "basketBall")

//프로토콜을 하나의 타입으로 사용하여 프로토콜을 받아서 해당 프로토콜을 반환해줌.
func updateMyProtocol(myProto: MyProtocol) -> MyProtocol {
    var newProtocol: MyProtocol = myProto
    newProtocol.myFavorite = "야구"
    return newProtocol
}

print(myProtocolOnlyStruct)
var udpatedProtocol = updateMyProtocol(myProto: myProtocolOnlyStruct)
print(udpatedProtocol)



