//
//  PhotoRequest.swift
//  BKclient
//
//  Created by rushan adelshin on 24.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import Foundation
import Alamofire

struct PhotoRequest {
    
    func downloadPhoto(byUrl url: String, completion: @escaping (UIImage) -> Void) {
        Alamofire.request(url).responseData { response in
            
            guard
                let data = response.data,
                let image = UIImage(data: data) else { return }
            
            completion(image)
            
        }
    }
    
}
