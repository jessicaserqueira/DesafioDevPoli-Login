//
//  AuthenticationProtocol.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 11/08/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation
public protocol AuthenticationProtocol {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
