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
    @IBOutlet weak var userRating: UILabel!
    @IBOutlet weak var reviewerRatingStars: UIStackView!
    
    var fullStarImage: UIImage = UIImage(named: "starEnabled")!
    var emptyStar: UIImage = UIImage(named: "starDisabled")!
    
    func setReview(review: Review){
        let starImageView = UIImageView(image: emptyStar)
        starImageView.frame = CGRect()
        
        userImage.layer.cornerRadius = userImage.frame.size.width/2
        userImage.image = review.userImage
        userName.text = review.userName
        userComment.text = review.userComment
        userRating.text = String(review.userRating)
        
        switch review.userRating {
        case 5:
            break;
        case 4:
            reviewerRatingStars.removeArrangedSubview(self)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 5)
            break;
        case 3:
            reviewerRatingStars.removeArrangedSubview(self)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 5)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 4)
            break;
        case 2:
            reviewerRatingStars.removeArrangedSubview(self)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 5)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 4)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 3)
            break;
        case 1:
            reviewerRatingStars.removeArrangedSubview(self)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 5)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 4)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 3)
            reviewerRatingStars.insertArrangedSubview(starImageView, at: 2)
            break;
        default:
            break;
        }
    }
}
