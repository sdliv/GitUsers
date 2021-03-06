//
//  FollowersUIColCollectionViewController.swift
//  GitUsers
//
//  Created by Sean Livingston on 3/16/17.
//  Copyright © 2017 Sean Livingston. All rights reserved.
//

import UIKit

private let reuseIdentifier = "gitFollwercell"

class FollowersUIColCollectionViewController: UICollectionViewController  {
    
    var gitUser: GitUser = GitUser()
    var gitFollowers:[[String:Any]] = [[String:Any]]()
    var myGitFollowers:[GitUser] = [GitUser]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFollowers(followerURL: gitUser.followersUrl!) { (theUsers) in
            print(theUsers)
            if let followers = theUsers as? [[String:Any]] {
                self.gitFollowers = followers
            }
            self.collectionView?.reloadData()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView?.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return gitFollowers.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FollowerCollectionViewCell
        let gitFollower = GitUser()
        let theFollower = gitFollowers[indexPath.row]
        
        gitFollower.userName = theFollower["login"] as? String
        gitFollower.avatarUrl = theFollower["avatar_url"] as? String
        gitFollower.email = theFollower["email"] as? String
        gitFollower.name = theFollower["name"] as? String
        gitFollower.location = theFollower["loation"] as? String
        gitFollower.followerCount = theFollower["followers"] as? Int
        gitFollower.followingCount = theFollower["following"] as? Int
        gitFollower.repoCount = theFollower["public_repos"] as? Int
        
        print(gitFollower.userName)
        print(gitFollower.name)
        print(theFollower["name"] as? String)
        print("STOP")
        
        cell.setupCell(user: gitFollower)
        
        myGitFollowers.append(gitFollower)
        
        
    
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedUser = myGitFollowers[indexPath.row]
        
        let vc: ProfileUIViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileUIViewController
        vc.theFollower = selectedUser
        
        self.navigationController?.pushViewController(vc, animated: true)
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
