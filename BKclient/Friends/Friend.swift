//
//  Friend.swift
//  BKclient
//
//  Created by rushan adelshin on 23.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Friend {
    var id = 0
    var firstName = ""
    var lastName = ""
    var photoUrl = ""
    
    convenience init(json: JSON) {
        self.init()
        id = json["id"].intValue
        firstName = json["first_name"].stringValue
        lastName = json["last_name"].stringValue
        photoUrl = json["photo_50"].stringValue
    }
}
