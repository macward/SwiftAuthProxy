// The Swift Programming Language
// https://docs.swift.org/swift-book


import FirebaseAuth
import FirebaseAuthCombineSwift

protocol AuthManagerProtocol {
    static func isAuth()
    static func destroySession()
}

protocol AuthChangesListener {
    static func listener(_ completion: @escaping (Bool) -> Void)
}

public class AuthenticationManager {
    
    public static func isAuth() -> Bool {
        Auth.auth().currentUser == nil ? false : true
    }
    
    public static func destroySession() throws {
        try Auth.auth().signOut()
    }
    
    public static func listener(_ completion: @escaping (Bool) -> Void) {
        Auth.auth().addStateDidChangeListener { auth, user in
            user == nil ? completion(false) : completion(true)
        }
    }
}
