//
//  CustomTextField.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 09/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    enum FieldType {
        case name
        case password
        case email
    }

    init(placeholder: String, type: FieldType, accessibilityIdentifier: String) {
        super.init(frame: .zero)
        autocapitalizationType = .none
        autocorrectionType = .no
        layer.borderWidth = 1
        layer.borderColor = DesignSystem.Colors.customBorderColor.cgColor
        layer.cornerRadius = 8
        backgroundColor = DesignSystem.Colors.customBackgroundTextField
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
        leftViewMode = .always
        translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = accessibilityIdentifier
        
        switch type {
        case .name, .email:
            font = UIFont.roboto(ofSize: 18)
            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [
                    NSAttributedString.Key.font: UIFont.roboto(ofSize: 18),
                    NSAttributedString.Key.foregroundColor: UIColor.gray
                ]
            )
        case .password:
            font = UIFont.roboto(ofSize: 18)
            isSecureTextEntry = true
            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [
                    NSAttributedString.Key.font: UIFont.roboto(ofSize: 18),
                    NSAttributedString.Key.foregroundColor: UIColor.gray
                ]
            )
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
