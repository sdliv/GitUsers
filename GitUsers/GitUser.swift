//
//  GitUser.swift
//  GitUsers
//
//  Created by Sean Livingston on 3/16/17.
//  Copyright © 2017 Sean Livingston. All rights reserved.
//

import Foundation
import UIKit

class GitUser: CustomStringConvertible {
    var userName: String?
    var avatarImage: UIImage?
    var name: String?
    var email: String?
    var location: String?
    var repoCount: Int?
    var followingCount: Int?
    var followerCount: Int?
    var followersUrl: String?
    var url: String?
    var avatarUrl: String?
    
    var description: String {
        get {
            return "GitUser: Username: \(userName), Name: \(name), Email: \(email), Location: \(location), Repo Count: \(repoCount), Following Count: \(followingCount), Follower Count: \(followerCount), Followers URL: \(followersUrl), URL: \(url), Avatar URL: \(avatarUrl)"
        }
    }
}
