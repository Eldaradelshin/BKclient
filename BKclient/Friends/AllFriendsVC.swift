//
//  AllFriendsVC.swift
//  BKclient
//
//  Created by rushan adelshin on 23.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import UIKit

class AllFriendsVC: UITableViewController {
    
    
let photoRequest = PhotoRequest()
let friendsRequest = FriendsRequest()
    
    
    var friends = [Friend]()
    var usersPhoto: [Int: UIImage] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showFriends()
        friendsRequest.loadFriendsData { [weak self] in
            self?.showFriends()
        }
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! AllFriendsCell
        
        let friend = friends[indexPath.row]
        cell.nameLabel.text = friend.firstName + friend.lastName
        if let photo = usersPhoto[indexPath.row] {
            cell.photoImage.image = photo
        } else {
            loadPhotos(indexPath: indexPath)
        }


        return cell
    }
 
      func showFriends() {
        tableView.reloadData()
     }
    
    func loadPhotos(indexPath: IndexPath) {
        photoRequest.downloadPhoto(byUrl: friends[indexPath.row].photoUrl) { [weak self] image in
            self?.usersPhoto[indexPath.row] = image
            self?.tableView.reloadRows(at: [indexPath], with: .none)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhoto", let ctrl = segue.destination as? FriendsPhotosVC, let indexpath = tableView.indexPathForSelectedRow {
            ctrl.ownerId = friends[indexpath.row].id
        }
    }
    
}
