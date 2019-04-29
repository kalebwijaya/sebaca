//
//  RatingController.swift
//  Instabook
//
//  Created by George Joseph Kristian on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

//  Rating Controller
//  Created by mohamed al-ghamdi on 17/04/2018.
//  Copyright © 2018 mohamed al-ghamdi. All rights reserved.

import UIKit

class RatingController: UIStackView {
    var starsRating = 0
    var starsEmptyPicName = "starDisabled" // change it to your empty star picture name
    var starsFilledPicName = "starEnabled" // change it to your filled star picture name
    override func draw(_ rect: CGRect) {
        let starButtons = self.subviews.filter{$0 is UIButton}
        var starTag = 1
        for button in starButtons {
            if let button = button as? UIButton{
                button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                button.tag = starTag
                starTag = starTag + 1
            }
        }
        setStarsRating(rating:starsRating)
    }
    
    func setStarsRating(rating:Int){
        self.starsRating = rating
        let stackSubViews = self.subviews.filter{$0 is UIButton}
        for subView in stackSubViews {
            if let button = subView as? UIButton{
                if button.tag > starsRating {
                    button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                }else{
                    button.setImage(UIImage(named: starsFilledPicName), for: .normal)
                }
            }
        }
    }
    @objc func pressed(sender: UIButton) {
        setStarsRating(rating: sender.tag)
    }
    
    func getStarsRating(rating:Int){
        
    }
}
