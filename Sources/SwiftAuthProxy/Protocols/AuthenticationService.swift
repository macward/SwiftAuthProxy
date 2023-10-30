//
//  AuthenticationService.swift
//
//
//  Created by Max Ward on 27/10/2023.
//

import Foundation

public protocol AuthenticationService {
    associatedtype T: Codable
    
    @discardableResult
    func signup(email: String, password: String) async throws -> T
    func signin(email: String, password: String) async throws -> T
}
