//
//  SignUpView.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 08/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol SignUpViewDelegate: AnyObject {
    func showAlert(message: String)
}

class SignUpView: UIView {
    weak var delegate: SignUpViewDelegate?
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.background
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SignUpView.mainView"
        return view
    }()
    
    var titleNavigation: UILabel = {
        let label = UILabel()
        label.text = "Criar conta"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cria sua conta e comece a gerenciar sua vida financeira"
        label.font = .roboto(ofSize: 18)
        label.textColor = DesignSystem.Colors.customLabel
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SignUpView.titleLabel"
        return label
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "SignUpView.textFieldStackView"
        return stack
    }()
    
    private lazy var nameTextField: CustomTextField = {
        return CustomTextField(placeholder: "Primeiro nome", type: .name, accessibilityIdentifier: "SignUpView.textFieldStackView")
    }()
    
    private lazy var lastNameTextField: CustomTextField = {
        return CustomTextField(placeholder: "Último nome", type: .name, accessibilityIdentifier: "SignUpView.textFieldStackView")
    }()
    
    private lazy var emailTextField: CustomTextField = {
        return CustomTextField(placeholder: "Email", type: .email, accessibilityIdentifier: "SignUpView.textFieldStackView")
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        return CustomTextField(placeholder: "Senha", type: .password, accessibilityIdentifier: "SignUpView.textFieldStackView")
    }()
    
    private lazy var confirmPasswordTextField: CustomTextField = {
        return CustomTextField(placeholder: "Confirme senha", type: .password, accessibilityIdentifier: "SignUpView.textFieldStackView")
    }()
    
    private lazy var termsButton: CustomButton = {
        return CustomButton(termsText: "Ao criar a conta, você concorda com nossos ", primaryText: "termos e condições de uso", accessibilityIdentifier: "SignUpView.termsButton")
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("CRIAR CONTA", for: .normal)
        button.setTitleColor(DesignSystem.Colors.background, for: .normal)
        button.backgroundColor = DesignSystem.Colors.customBackgroundButton
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 0, y: 0, width: 294, height: 50)
        button.titleLabel?.font = .roboto(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "SignUpView.signUpButton"
        button.isEnabled = false
        return button
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

extension SignUpView {
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(nameTextField)
        textFieldStackView.addArrangedSubview(lastNameTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        textFieldStackView.addArrangedSubview(confirmPasswordTextField)
        mainView.addSubview(termsButton)
        mainView.addSubview(signUpButton)
        
        termsButton.titleLabel?.numberOfLines = 0
        termsButton.titleLabel?.lineBreakMode = .byWordWrapping
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
            titleLabel.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 62),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            textFieldStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            textFieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 307)
        ])
        
        NSLayoutConstraint.activate([
            termsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            termsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 74),
            termsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -74),
            termsButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -52)
        ])
    }
}

// MARK: - Actions

extension SignUpView {
    @objc private func signUpButtonTapped() {
        updateSignUpButtonState()
        
        if signUpButton.isEnabled {
            delegate?.showAlert(message: "Cadastro realizado com sucesso!")
        }
    }
    
    @objc private func textFieldDidChange() {
        updateSignUpButtonState()
    }
    
    @objc func setupActions() {
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private func updateSignUpButtonState() {
        let isNameValid = !(nameTextField.text?.isEmpty ?? true)
        let isLastNameValid = !(lastNameTextField.text?.isEmpty ?? true)
        let isEmailValid = emailTextField.text?.isValidEmail ?? false
        let isPasswordValid = passwordTextField.text?.isValidPassword ?? false
        let isConfirmPasswordValid = confirmPasswordTextField.text == passwordTextField.text && isPasswordValid
        
        let isFormValid = isNameValid && isLastNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid
        
        signUpButton.isEnabled = isFormValid
        signUpButton.backgroundColor = isFormValid ? DesignSystem.Colors.accent : DesignSystem.Colors.customBackgroundButton
    }
}
