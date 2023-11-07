//
//  PasskeyView.swift
//  PasskeySubdomainExample
//
//  Created by Vivian Phung on 11/6/23.
//

import SwiftUI

struct PasskeyView: View {
    @State private var userId: String = ""
    @State var authManager: PasskeyAuthenticationManager?

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                authManager?.loginWithPasskey()
            }) {
                Text("Login with Passkey")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Button(action: {
                authManager?.createPasskey()

            }) {
                Text("Create Passkey")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            authManager = PasskeyAuthenticationManager()
        }
    }
}

#Preview {
    PasskeyView()
}
