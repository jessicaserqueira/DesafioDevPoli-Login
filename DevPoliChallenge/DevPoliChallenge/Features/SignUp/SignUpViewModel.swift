//
//  SignUpViewModel.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 08/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol SignUpDelegate: AnyObject {
    func showAlert(message: String)
}

class SignUpViewModel {
    weak var delegate: SignUpDelegate?
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigateBackToLogin() {
        navigationController.popViewController(animated: true)
      }
}
