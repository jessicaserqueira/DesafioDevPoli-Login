//
//  String+ext.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 11/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = K.RegEx.emailRegEx
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordRegEx = K.RegEx.passwordRegEx
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: self)
    }
    
    var asInt: Int? {
        Int(self)
    }
}
