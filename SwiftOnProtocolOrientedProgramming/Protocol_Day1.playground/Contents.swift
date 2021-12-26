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
    var myFavorite: String { get }
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
    
    var myFavorite: String {
        return "Soccer"
    }
    
    var myHome: Home = {
        let myHomes = Home(address: "용인 그 어딘가", myOwn: true)
        return myHomes
    }()
}

let myStruct = MyStruct()
print(myStruct.description)



