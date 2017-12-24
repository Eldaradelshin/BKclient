//
//  FriendsRequest.swift
//  BKclient
//
//  Created by rushan adelshin on 23.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class FriendsRequest {
    
    let baseUrl = "https://api.vk.com"
    
    
    func loadFriendsData(completion: @escaping () -> Void) {
        
        let path = "/method/friends.getRequest"
        
        let parameters: Parameters = [
            "access_token": userDefaults.string(forKey: "token") ?? print("no Token"),
            "fields": "nickname,photo_50,domain",
            "v": "5,68",
            ]
        
        let  url  =  baseUrl + path

        
        Alamofire.request(url, method: .get, parameters: parameters).responseData  { response in
            
            guard let data = response.value else { return }
            let json = try! JSON(data: data)
            let friends = json["response"]["items"].array?.flatMap { Friend(json: $0) } ?? []
            
        completion()
}
}
    
 
    func loadFriendsPhotos(ownerId: Int, completion: @escaping ([Photo]) -> Void) {
 
    let path = "/method/photos.getAll"
    
    let parameters: Parameters = [
    "owner_id": ownerId,
    "access_token": userDefaults.string(forKey: "token") ?? print("no Token"),
    "v": "5.68",
    "fields":"nickname,domain,photo_50",
    ]
        
        let url = baseUrl + path
        
        Alamofire.request(url, method: .get, parameters: parameters).responseData  {  response in
            
            guard let data = response.value else { return }
            let json =  try! JSON(data: data)
            let photos = json["response"]["items"].array?.flatMap { Photo(json: $0) } ?? []
            completion(photos)
    }
}
}
