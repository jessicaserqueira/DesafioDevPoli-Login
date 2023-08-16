//
//  SignInViewModel.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 08/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SignInViewModel {
    weak var delegate: SignInDelegate?
    private let navigationController: UINavigationController
    private var user = UserModel(email: "meu@gmail.com", password: "Teste@123")
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateToSignUp() {
        let viewModel = SignUpViewModel(navigationController: navigationController)
        let signUpViewController = SignUpViewController(viewModel: viewModel)
        navigationController.pushViewController(signUpViewController, animated: true)
    }
    
    func signIn(email: String?, password: String?) {
        guard let email = email, let password = password, email.isValidEmail, password.isValidPassword else {
            return
        }
        
        if email == user.email && password == user.password {
            authenticateUser(email: email, password: password)
        } else {
            delegate?.showAlert(message: "Credenciais inválidas. Use um e-mail e senha válidos.")
        }
    }
    
    private func authenticateUser(email: String, password: String) {
        print("Login efetuado com sucesso!")
    }
    
    func requestPasswordRecovery(email: String?) {
        guard let email = email, email.isValidEmail else {
            delegate?.showAlert(message: "Informe um e-mail válido para continuar.")
            return
        }
    }
}
