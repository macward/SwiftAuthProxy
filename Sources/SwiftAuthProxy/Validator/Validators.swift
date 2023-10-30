//
//  Validators.swift
//  
//
//  Created by Max Ward on 30/10/2023.
//

import Foundation

public class EmailValidator: Validatable {
    
    public var errorMessage: String = ""
    
    private let emailPattern = #"^\S+@\S+\.\S+$"#
    
    public init() {}
    
    public func validate(_ str: String) -> Bool {
        if str.isEmpty {
            self.errorMessage = "Email could not be empty"
            return false
        }
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        if  !predicate.evaluate(with: str) {
            self.errorMessage = "Invalid email address"
            return false
        }
        self.errorMessage = ""
        return true
    }
}

public class PasswordValidator: Validatable {
    
    public var errorMessage: String = ""
    
    public init() {
        
    }
    
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


public class NotEmptyValidator: Validatable {
    
    public var errorMessage: String = ""
    
    public init() {
        
    }
    public func validate(_ str: String) -> Bool {
        if str.isEmpty {
            errorMessage = "The value is empty"
            return false
        }
        if str.count < 3 {
            errorMessage = "The value should be grather than 3"
            return false
        }
        return true
    }
}
