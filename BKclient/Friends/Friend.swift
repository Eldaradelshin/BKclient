//
//  Friend.swift
//  BKclient
//
//  Created by rushan adelshin on 23.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import Foundation


class Friend {
    
    var id : UInt
    var firstName : String
    var lastName : String
    var smallPhotoURL : String
    var bigPhotoURL : String
    
    init( _ user : Any) {
        let user  = user as? [String: Any]
        self.id = user!["user_id"] as! UInt
        self.firstName = user!["first_name"] as! String
        self.lastName = user!["last_name"] as! String
        self.smallPhotoURL = user!["photo_50"] as! String
        self.bigPhotoURL = user!["photo_100"] as! String
    }
}

