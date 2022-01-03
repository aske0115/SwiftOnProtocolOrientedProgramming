import Darwin
// Collection protocol을 확장하여 shuffle() 메소드를 구현
extension Collection where Self: ExpressibleByArrayLiteral {
    func shuffle() -> [Iterator.Element] {
        return sorted(){ left, right in
            return arc4random() < arc4random()
        }
    }
}


print([10,20,1,4,-22,1029,-44,-32].shuffle())
print([10,20,1,4,-22,1029,-44,-32].shuffle())
print([10,20,1,4,-22,1029,-44,-32].shuffle())
print([10,20,1,4,-22,1029,-44,-32].shuffle())


//non protocol Extension with Regex

protocol TextValidation {
    var regExMatchingString: String { get }
    var validationMessage: String { get }
    var regExFindMatchString: String { get }
    func validateString(str: String) -> Bool
    func getMatchingString(str: String) -> String?
}

class AlphabeticValidation1: TextValidation {
    static let sharedInstance = AlphabeticValidation1()
    private init() {}
    
    let regExFindMatchString: String = "^[a-zA-Z]{0,10}"
    let validationMessage: String = "Can only contain Alpha characters"
    var regExMatchingString: String {
        get {
            return regExFindMatchString + "$"
        }
    }
    
    func validateString(str: String) -> Bool {
        if let _ = str.range(of: regExMatchingString, options: .regularExpression) {
            return true
        }
        return false
    }
    
    func getMatchingString(str: String) -> String? {
        if let newMatch = str.range(of: regExFindMatchString, options: .regularExpression) {
            return String(str[newMatch.lowerBound..<newMatch.upperBound])
        }
        return nil
    }
}

AlphabeticValidation1.sharedInstance.validateString(str: "gnlaskdn")


//protocol Extension

protocol TextValidationEx {
    var regExFindMatchString: String { get }
    var validationMessage: String { get }
}

extension TextValidationEx {
    var regExMatchingString: String {
        get {
            regExFindMatchString + "$"
        }
    }
    
    func validateString(str: String) -> Bool {
        if let _ = str.range(of: regExMatchingString, options: .regularExpression) {
            return true
        }
        return false
    }
    
    func getMatchingString(str: String) -> String? {
        if let newMatch = str.range(of: regExFindMatchString, options: .regularExpression) {
            return String(str[newMatch.lowerBound..<newMatch.upperBound])
        }
        return nil
    }
}

class AlphaCharacterValidation2: TextValidationEx {
    var regExFindMatchString = "^[a-zA-Z]{0,2}"
    
    var validationMessage = "hahaha"
    
    static let shared: AlphaCharacterValidation2 = AlphaCharacterValidation2()
    private init() { }
}


AlphaCharacterValidation2.shared.validateString(str: "a")
AlphaCharacterValidation2.shared.validateString(str: "1")
AlphaCharacterValidation2.shared.validateString(str: "a2")

