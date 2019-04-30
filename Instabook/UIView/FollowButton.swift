//
//  FollowButton.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class FollowButton: UIButton {

   var isFollowed = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton(){
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        layer.cornerRadius = frame.size.height/2
        setTitleColor(#colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1), for: .normal)
        addTarget(self, action: #selector(FollowButton.buttonPressed), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed(){
        activeteButton(bool : !isFollowed)
    }
    
    func activeteButton(bool : Bool){
        isFollowed = bool
        
        let color = bool ? #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let title = bool ? "Following":"Follow"
        let titleColor = bool ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        
        backgroundColor = color
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
    }
}
