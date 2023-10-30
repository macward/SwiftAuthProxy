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
    @EnvironmentObject var appStateManager: GlobalStateManager
    
    public init(authView: @escaping () -> AuthView, guestView: @escaping () -> GuestView) {
        self.authView = authView()
        self.guestView = guestView()
    }
    
    public var body: some View {
        if appStateManager.isAuth {
            authView
        } else {
            guestView
        }
    }
}

public class GlobalStateManager: ObservableObject {
    @Published var isAuth: Bool = false
    // store the auth state into UserDefault, it is useful when the app start
    // and show the correct screen
    @AppStorage("auth_state") private var authState: Bool = false
    
    public init() {
        addObserver()
        isAuth = authState
    }
    
    private func addObserver() {
        AuthenticationManager.listener { isAuth in
            self.authState = isAuth
            self.isAuth = self.authState
        }
    }
}
