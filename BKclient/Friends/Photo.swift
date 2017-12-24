//
//  Photo.swift
//  BKclient
//
//  Created by rushan adelshin on 24.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Photo {
    var url = ""
    
    convenience init(json: JSON) {
        self.init()
        url = json["photo_130"].stringValue
    }
    
}
