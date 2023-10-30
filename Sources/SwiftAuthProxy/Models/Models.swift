//
//  Models.swift
//  
//
//  Created by Max Ward on 27/10/2023.
//

import Foundation

public struct UserScheme: Codable {
    public var id: String
    public var email: String
    public var isEmailVerified: Bool
    
    public init(id: String, email: String, isEmailVerified: Bool) {
        self.id = id
        self.email = email
        self.isEmailVerified = isEmailVerified
    }
}

public struct UserCredentials {
    var email: String
    var password: String
}
