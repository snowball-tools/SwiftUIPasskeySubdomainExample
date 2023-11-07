//
//  PasskeyAuthenticationManager.swift
//  PasskeySubdomainExample
//
//  Created by Vivian Phung on 11/6/23.
//

import AuthenticationServices

class PasskeyAuthenticationManager: NSObject, ASAuthorizationControllerPresentationContextProviding {

    func loginWithPasskey() {
        let challenge: Data = Data("your challenge from server".utf8)
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: "snovvball.xyz")
        let platformKeyRequest = platformProvider.createCredentialAssertionRequest(challenge: challenge)
        let authController = ASAuthorizationController(authorizationRequests: [platformKeyRequest])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }

    func createPasskey(username: String = "Snowball") {
        let challenge: Data = Data("challenge from server".utf8)
        let userID: Data = Data("userid from server".utf8)
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: "snovvball.xyz")
        let platformKeyRequest = platformProvider.createCredentialRegistrationRequest(challenge: challenge, name: username, userID: userID)
        let authController = ASAuthorizationController(authorizationRequests: [platformKeyRequest])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            fatalError("Unable to find a window scene.")
        }
        guard let window = windowScene.keyWindow else {
            fatalError("Unable to find a key window.")
        }
        return window
    }
}

extension PasskeyAuthenticationManager: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        print("Passkey:", authorization.credential)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Authorization error:", error)
    }
}
