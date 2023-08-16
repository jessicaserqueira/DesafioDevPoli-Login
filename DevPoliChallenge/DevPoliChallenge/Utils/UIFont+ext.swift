//
//  UIFont+ext.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 09/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

extension UIFont {
    static func roboto(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Roboto-Regular", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    static func robotoMedium(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Roboto-Medium", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    static func robotoBold(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Roboto-Bold", size: size) {
            return font
        } else {
            return UIFont.boldSystemFont(ofSize: size)
        }
    }
}
