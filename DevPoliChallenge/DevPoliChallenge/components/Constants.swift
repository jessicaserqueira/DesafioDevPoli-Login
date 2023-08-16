//
//  Constants.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 11/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
struct K {
    struct RegEx {
        static let emailRegEx =  "^[a-z0-9_%+-]+([.-][a-z0-9]+)*@[a-z0-9]+([.-][a-z0-9]+)*\\.[a-z]{2,3}$"
        static let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
    }
}
