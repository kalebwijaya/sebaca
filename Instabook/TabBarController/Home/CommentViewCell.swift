//
//  CommentViewCell.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class CommentViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var comment: UITextView!
    
    func setComment(comment : Comment) {
        profileImage.image = comment.profileImage
        userName.text = comment.userName
        self.comment.text = comment.comment
    }

}
