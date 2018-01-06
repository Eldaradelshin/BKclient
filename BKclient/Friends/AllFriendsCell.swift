//
//  AllFriendsCell.swift
//  BKclient
//
//  Created by rushan adelshin on 23.12.2017.
//  Copyright © 2017 Eldar Adelshin. All rights reserved.
//

import UIKit

class AllFriendsCell: UITableViewCell {
    
    var idFrend : UInt!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
