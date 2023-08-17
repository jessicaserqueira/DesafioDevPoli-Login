//
//  SignInView.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 08/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func didTapsignUPButton()
    func signInButtonPressed(email: String, password: String)
    func forgotPasswordButtonTapped()
    func showAlert(message: String)
}

class SignInView: UIView {
    
    weak var delegate: SignInViewDelegate?
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.background
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SignInView.mainView"
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá! \nQuer melhorar sua vida financeira?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SignInView.titleLabel"
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Quer melhorar sua vida financeira?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SignInView.informationLabel"
        return label
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "SignInView.textFieldStackView"
        return stack
    }()
    
    lazy var emailTextField: CustomTextField = {
        return CustomTextField(placeholder: "Email", type: .email, accessibilityIdentifier: "SignInView.emailTextField")
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        return CustomTextField(placeholder: "Senha", type: .password, accessibilityIdentifier: "SignInView.passwordTextField")
    }()
    
    private lazy var forgotPassworView: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "SignInView.forgotPassworView"
        return stack
    }()
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Esqueci a senha", for: .normal)
        button.setTitleColor(DesignSystem.Colors.primary, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "SignInView.forgotPasswordButton"
        return button
    }()
    
    private lazy var SignINButtonView: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "SignInView.SignINButtonView"
        return stack
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(DesignSystem.Colors.background, for: .normal)
        button.backgroundColor = DesignSystem.Colors.accent
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 0, y: 0, width: 294, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "SignInView.signInButton"
        return button
    }()
    
    private lazy var signUPButton: CustomButton = {
        return CustomButton(termsText: "Não tem conta? ", primaryText: "Criar conta", accessibilityIdentifier: "SignInView.signUPButton")
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints

extension SignInView {
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(informationLabel)
        mainView.addSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        textFieldStackView.addArrangedSubview(forgotPassworView)
        forgotPassworView.addSubview(forgotPasswordButton)
        textFieldStackView.addArrangedSubview(SignINButtonView)
        SignINButtonView.addSubview(signInButton)
        mainView.addSubview(signUPButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 42),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            informationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            informationLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            textFieldStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22),
            textFieldStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 262)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.trailingAnchor.constraint(equalTo: forgotPassworView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            forgotPassworView.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            forgotPassworView.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            SignINButtonView.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            SignINButtonView.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor),
            
            signInButton.leadingAnchor.constraint(equalTo: SignINButtonView.leadingAnchor, constant: 22),
            signInButton.trailingAnchor.constraint(equalTo: SignINButtonView.trailingAnchor, constant: -22),
            signInButton.centerYAnchor.constraint(equalTo: SignINButtonView.centerYAnchor),
            signInButton.centerXAnchor.constraint(equalTo: SignINButtonView.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        NSLayoutConstraint.activate([
            signUPButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUPButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 100),
            signUPButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -100),
            signUPButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -52)
        ])
    }
}

// MARK: - Actions

extension SignInView {
    private func setupActions() {
        signInButton.addTarget(self, action: #selector(signINButtonTapped), for: .touchUpInside)
        signUPButton.addTarget(self, action: #selector(signUPButtonTapped), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    @objc func signINButtonTapped() {
        print("Sign In button tapped")
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            delegate?.showAlert(message: "Informe um e-mail e senha para continuar.")
        } else {
            delegate?.signInButtonPressed(email: email, password: password)
        }
    }
    
    @objc private func signUPButtonTapped() {
        delegate?.didTapsignUPButton()
    }
    
    @objc private func forgotPasswordButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty else {
            delegate?.showAlert(message: "Informe o e-mail para continuar")
            return
        }
        
        if !email.isValidEmail {
            delegate?.showAlert(message: "Email inválido. Informe um email válido.")
            return
        }
        delegate?.showAlert(message: "Enviamos um e-mail para recuperação de senha")
    }
}
