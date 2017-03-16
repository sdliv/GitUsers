//
//  FollowerCollectionViewCell.swift
//  GitUsers
//
//  Created by Sean Livingston on 3/16/17.
//  Copyright © 2017 Sean Livingston. All rights reserved.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var gitUserLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    func setupCell(user:GitUser) {
        gitUserLabel.text = user.name
        avatarImage.imageFromURL(urlString: user.avatarUrl!)
    }
}
