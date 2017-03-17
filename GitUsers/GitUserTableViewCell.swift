//
//  GitUserTableViewCell.swift
//  GitUsers
//
//  Created by Sean Livingston on 3/16/17.
//  Copyright © 2017 Sean Livingston. All rights reserved.
//

import UIKit

class GitUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gitUserNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(gitUser:GitUser) {
        if let url = gitUser.avatarUrl {
            avatarImageView.imageFromURL(urlString: url)
        }
        self.gitUserNameLabel.text = gitUser.userName
        
    }

}
