//
//  BookmarkButton.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class BookmarkButton: UIButton {

    var isBookmarked = false
    
    let image = UIImage(named: "save")?.withRenderingMode(.alwaysTemplate)
    
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
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        addTarget(self, action: #selector(BookmarkButton.buttonPressed), for: .touchUpInside)
        
        setImage(image, for: .normal)
        imageView!.tintColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        
    }
    
    @objc func buttonPressed(){
        activeteButton(bool : !isBookmarked)
    }
    
    func activeteButton(bool : Bool){
        isBookmarked = bool
        
        let color = bool ? #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let tint = bool ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        
        backgroundColor = color
        imageView!.tintColor = tint
    }

}
