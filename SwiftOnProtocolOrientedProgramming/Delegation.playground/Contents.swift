protocol DisplayNameDelegate {
    func displayName(name: String)
}

struct Person {
    var displayNameDelegate: DisplayNameDelegate?
    
    var firstName  = "" {
        didSet {
            self.displayNameDelegate?.displayName(name: getFullName())
        }
    }
    
    var lastName  = "" {
        didSet {
            self.displayNameDelegate?.displayName(name: getFullName())
        }
    }
    
    
    private func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

struct DelegatePerson : DisplayNameDelegate {
    func displayName(name: String) {
        print("my name is \(name)")
    }
}


let displayPerson = DelegatePerson()
var person = Person()
person.displayNameDelegate = displayPerson

person.firstName = "lee"
person.lastName = "geunhwa"


