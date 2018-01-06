//
//  FriendsRequest.swift
//  BKclient
//
//  Created by rushan adelshin on 23.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import Foundation
import Alamofire

class FriendsRequest {
    
    let baseUrl = "https://api.vk.com"
    
    func loadFriendsData( completion: @escaping ([Friend]) -> Void) {
        
        let path = "/method/friends.getRequest"
        
        let parameters: Parameters = [ "access_token"  :   userDefaults.string(forKey: "token") ?? print("no Token"),
                                       "order"         :   "name",
                                       "fields"        :   "nickname,photo_100",
                                       "v"             :   "5,68",]
        
        let  url  =  baseUrl + path

        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            let responseVk = response.value as! [String: Any]
            let dataUsersAny = responseVk["response"] as! [Any]
            let friend = dataUsersAny.map(){ Friend($0) }
            completion(friend)
}
}

}

