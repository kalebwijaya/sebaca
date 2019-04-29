//
//  ReviewCell.swift
//  Instabook
//
//  Created by George Joseph Kristian on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var userComment: UILabel!
    
    func setReview(review: Review){
        userImage.layer.cornerRadius = userImage.frame.size.width/2
        
        userImage.image = review.userImage
        userName.text = review.userName
        userComment.text = review.userComment
    }
}
