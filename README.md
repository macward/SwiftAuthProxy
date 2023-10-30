# Swift Auth Proxy
A tiny library that help you to create auth flows into your app.

## Authentication Service
```swift
public protocol AuthenticationService {
    associatedtype T: Codable
    @discardableResult
    func signup(email: String, password: String) async throws -> T
    func signin(email: String, password: String) async throws -> T
}
```

### Firebase authentication service using email and password
```swift
public class FirebaseEmailAuthenticationService: AuthenticationService {
    
    public init() {}
    
    public func signin(email: String, password: String) async throws -> UserScheme {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return UserScheme(id: authDataResult.user.uid,
                          email: authDataResult.user.email ?? "",
                          isEmailVerified: authDataResult.user.isEmailVerified)
    }
    
    public func signup(email: String, password: String) async throws -> UserScheme {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return UserScheme(id: authDataResult.user.uid,
                          email: authDataResult.user.email ?? "",
                          isEmailVerified: authDataResult.user.isEmailVerified)
    }
}
```

## Validators
Create validations using validatable protocol.
```swift
public protocol Validatable {
    var errorMessage: String { get set}
    func validate(_ str: String) -> Bool
}
```
### Creating a validator

```swift
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