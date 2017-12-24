//
//  FriendsPhotosVC.swift
//  BKclient
//
//  Created by rushan adelshin on 24.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import UIKit

class FriendsPhotosVC: UICollectionViewController {
    
    var ownerId = 0

    let photoRequest = PhotoRequest()
    let friendRequest = FriendsRequest()
    
    var photos = [Photo]()
    var photosCache: [Int: UIImage] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

          showUPhoto()
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if let photo = photosCache[indexPath.row] {
            cell.photoView.image = photo
        } else {
            loadPhotos(indexPath: indexPath)
        }
 
        return cell
    }
    
    func showUPhoto() {
        friendRequest.loadFriendsPhotos(ownerId: ownerId) { [weak self] photos in
            self?.photos = photos
            self?.collectionView?.reloadData()
        }
    }
    
    func loadPhotos(indexPath: IndexPath) {
        photoRequest.downloadPhoto(byUrl: photos[indexPath.row].url) { [weak self] image in
            self?.photosCache[indexPath.row] = image
            self?.collectionView?.reloadItems(at: [indexPath])
            
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
