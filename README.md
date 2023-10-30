# Swift Auth Proxy

A small library that helps you create authentication flows in your application.

## Validators
Create validations using validatable protocol.
```
public protocol Validatable {
    var errorMessage: String { get set}
    func validate(_ str: String) -> Bool
}
```
then create your validation
```
public class PasswordValidator: Validatable {
    public var errorMessage: String = ""
    
    public func validate(_ str: String) -> Bool {
        // password is empty
        if str.count < 6 {
            self.errorMessage = "Password must be at least 6 characters long."
            return false
        }
        // password lowercase
        if !str.contains(where: { $0.isLowercase }) {
            self.errorMessage = "Password must include at least 1 lowercase letter."
            return false
        }
        // check uppercase
        if !str.contains(where: { $0.isUppercase }) {
            self.errorMessage = "Password must include at least 1 uppercase letter."
            return false
        }
        if !str.contains(where: { "!@#$%^&*()_-+=[{]};:'\",<.>/?".contains($0) }) {
            self.errorMessage = "Password must include at least 1 special character."
            return false
        }
        self.errorMessage = ""
        return true
    }
}
```