//
//  File.swift
//  
//
//  Created by Max Ward on 27/10/2023.
//

import SwiftUI

public struct AuthContainerView<AuthView: View, GuestView: View>: View {
    
    @ViewBuilder var authView: AuthView
    @ViewBuilder var guestView: GuestView
    var isAuth: Bool
    
    public init(isAuth: Bool, authView: @escaping () -> AuthView, guestView: @escaping () -> GuestView) {
        self.isAuth = isAuth
        self.authView = authView()
        self.guestView = guestView()
    }
    
    public var body: some View {
        if isAuth {
            authView
        } else {
            guestView
        }
    }
}
