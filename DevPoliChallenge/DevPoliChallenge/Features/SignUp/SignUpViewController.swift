//
//  SignUpViewController.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 08/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController  {
    
    private var viewModel: SignUpViewModel
    private var customView = SignUpView()
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        navigationItem.titleView = customView.titleNavigation
        let backButton = UIBarButtonItem(
            image: UIImage(named: "left"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
           navigationItem.leftBarButtonItem = backButton
        
        view = customView
        customView.delegate = self
    }
    
    @objc func backButtonTapped() {
        viewModel.navigateBackToLogin()
     }
}

extension SignUpViewController: SignUpViewDelegate {
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
