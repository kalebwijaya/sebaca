//
//  Review.swift
//  Instabook
//
//  Created by George Joseph Kristian on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import Foundation
import UIKit

class Review {
    var userImage: UIImage
    var userName: String
    var userComment: String
    
    init(userImage: UIImage, userName: String, userComment: String){
        self.userImage = userImage
        self.userName = userName
        self.userComment = userComment
    }
}
