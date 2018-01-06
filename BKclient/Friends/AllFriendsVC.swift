//
//  AllFriendsVC.swift
//  BKclient
//
//  Created by rushan adelshin on 23.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import UIKit
import Alamofire



class AllFriendsVC: UITableViewController {
    
 let friendsRequest = FriendsRequest()
 
    var friend = [Friend]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsRequest.loadFriendsData() { [weak self] friend in
            self?.friend = friend
            self?.tableView?.reloadData()
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friend.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! AllFriendsCell
        
        cell.nameLabel.text = friend[indexPath.row].firstName + " " + friend[indexPath.row].lastName
        cell.imageView?.setImageFromURl(stringImageUrl: friend[indexPath.row].smallPhotoURL)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhoto" {
            let cell = sender as! AllFriendsCell
            let selectedFrend = friend.filter({ $0.id == cell.idFrend})
            
            if selectedFrend.count == 0 {
                fatalError()
            }
            let fotoMyFrendCollectionViewController = segue.destination as! FriendsPhotosVC
            fotoMyFrendCollectionViewController.firstName = selectedFrend[0].firstName
            fotoMyFrendCollectionViewController.lastName = selectedFrend[0].lastName
            fotoMyFrendCollectionViewController.bigPhotoURL = selectedFrend[0].bigPhotoURL
        }
    }    }

