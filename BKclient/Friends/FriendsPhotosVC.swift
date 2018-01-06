//
//  FriendsPhotosVC.swift
//  BKclient
//
//  Created by rushan adelshin on 24.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FriendsPhotosVC: UICollectionViewController {
    
    let friendRequest = FriendsRequest()
    
    var firstName   = ""
    var lastName    = ""
    var bigPhotoURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

          self.title = firstName + " " + lastName
        
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        cell.photoView.setImageFromURl(stringImageUrl: bigPhotoURL)
 
        return cell
    }
    
}

