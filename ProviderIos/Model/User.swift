//
//  User.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct User {
    let firstname: String
    let lastname: String
    let phonenumber: String
    let id: Int
}

/// Mark: - extension Friend
/// Put init functions to extension so default constructor
/// for the struct is created
extension User {
    init?(json: JSON) {
        guard let id = json["id"] as? Int,
            let firstname = json["firstname"] as? String,
            let lastname = json["lastname"] as? String,
            let phonenumber = json["phonenumber"] as? String else {
                return nil
        }
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.phonenumber = phonenumber
    }
}
