//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    private var viewModel: SignInViewModel
    private var customView: SignInView
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        self.customView = SignInView() 
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.delegate = self
        
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension SignInViewController: SignInViewDelegate {
    func signInButtonPressed(email: String, password: String) {
        viewModel.signIn(email: email, password: password)
    }
    
    func didTapsignUPButton() {
        viewModel.navigateToSignUp()
    }
    
    func forgotPasswordButtonTapped() {
        viewModel.requestPasswordRecovery(email: customView.emailTextField.text)
    }
}
