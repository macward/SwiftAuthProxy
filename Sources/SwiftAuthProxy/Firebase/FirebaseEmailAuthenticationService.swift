//
//  FirebaseEmailAuthenticationService.swift
//
//
//  Created by Max Ward on 27/10/2023.
//

import Foundation
import FirebaseAuth

public enum AuthError: Error {
    case InvalidCredentials
    case CreateAccountFailure
}

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
