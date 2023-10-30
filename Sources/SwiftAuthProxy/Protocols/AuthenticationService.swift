//
//  AuthenticationService.swift
//
//
//  Created by Max Ward on 27/10/2023.
//

import Foundation

public protocol AuthenticationService {
    func signup(email: String, password: String) async throws -> UserScheme
    func signin(email: String, password: String) async throws -> UserScheme
}
