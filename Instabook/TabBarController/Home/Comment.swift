//
//  Comment.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import Foundation

class Comment{
    var profileImage :UIImage
    var userName :String
    var comment :String
    
    init(profileImage:UIImage, userName:String, comment:String) {
        self.profileImage = profileImage
        self.userName = userName
        self.comment = comment
    }
}
