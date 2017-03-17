//
//  ProfileUIViewController.swift
//  GitUsers
//
//  Created by Sean Livingston on 3/16/17.
//  Copyright © 2017 Sean Livingston. All rights reserved.
//

import UIKit

class ProfileUIViewController: UIViewController {
    
    var theFollower:GitUser = GitUser()
    
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var repoCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(theFollower)

        setupUser(gitUser: theFollower)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUser(gitUser:GitUser) {
        
        avatarImage.imageFromURL(urlString: gitUser.avatarUrl!)
        emailLabel.text = gitUser.email
        followerCountLabel.text = "\(gitUser.followerCount)"
        followingCountLabel.text = "\(gitUser.followingCount)"
        locationLabel.text = "\(gitUser.location)"
        userNameLabel.text = "\(gitUser.userName!)"
        nameLabel.text = "\(gitUser.name)"
        repoCountLabel.text = "\(gitUser.repoCount)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
