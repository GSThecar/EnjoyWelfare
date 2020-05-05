//
//  SignInViewController.swift
//  EnjoyWelfare
//
//  Created by 이덕화 on 2020/05/05.
//  Copyright © 2020 GSTheCar. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignInViewController: UIViewController {

    @IBOutlet weak var signInStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProviderSignInView()
    }
    
    @objc func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func setupProviderSignInView() {
        let authorizationAppleIdButton = ASAuthorizationAppleIDButton()
        authorizationAppleIdButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        signInStackView.addArrangedSubview(authorizationAppleIdButton)
    }

}

extension SignInViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let _ = appleIDCredential.user
            let _ = appleIDCredential.email
            let _ = appleIDCredential.fullName?.givenName
            let _ = appleIDCredential.fullName?.familyName
        case let passwordCredential as ASPasswordCredential:
            let _ = passwordCredential.user
            let _ = passwordCredential.password
        default:
            break
        }
    }
}

extension SignInViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
