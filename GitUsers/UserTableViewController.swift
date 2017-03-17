//
//  UserTableViewController.swift
//  GitUsers
//
//  Created by Sean Livingston on 3/16/17.
//  Copyright © 2017 Sean Livingston. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    
    
    var gitUsers = [GitUser]()
    //    var filteredUsers = [GitUser]()
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.definesPresentationContext = false
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.showsCancelButton = true
        self.searchController.searchBar.searchBarStyle = .prominent
        self.searchController.searchBar.sizeToFit()
        self.searchController.searchBar.barStyle = UIBarStyle.black
        self.searchController.searchBar.barTintColor = UIColor.black
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.navigationItem.titleView = self.searchController.searchBar
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.reloadData()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let userName = searchController.searchBar.text
        getUser(userName: userName!) { (theUser) in
            self.gitUsers.removeAll(keepingCapacity: false)
            self.tableView.reloadData()
            
            self.tableView.reloadData()
            if let gitUser = theUser as? [String:Any] {
                let user = GitUser()
                user.userName = gitUser["login"] as? String
                user.avatarUrl = gitUser["avatar_url"] as? String
                user.followersUrl = gitUser["followers_url"] as? String
                user.name = gitUser["name"] as? String
                print(user)
                print(theUser)
                
                self.gitUsers.append(user)
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        gitUsers.removeAll(keepingCapacity: false)
        self.searchController.searchBar.text = ""
        self.tableView.reloadData()
        print("canceled")
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        gitUsers.removeAll(keepingCapacity: false)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gitUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gitUserCell", for: indexPath) as! GitUserTableViewCell
        
        let user = gitUsers[indexPath.row]
        
        cell.setupCell(gitUser: user)
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = gitUsers[indexPath.row]
        
        let vc: FollowersUIColCollectionViewController = self.storyboard?.instantiateViewController(withIdentifier: "FollowersUIColCollectionViewController") as! FollowersUIColCollectionViewController
        
        vc.gitUser = selectedUser
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
