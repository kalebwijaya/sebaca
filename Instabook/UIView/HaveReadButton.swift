//
//  HaveReadButton.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class HaveReadButton: UIButton {

    var haveRead = false
    
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
        setTitleColor(#colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1) , for: .normal)
        addTarget(self, action: #selector(HaveReadButton.buttonPressed), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed(){
        activeteButton(bool : !haveRead)
    }
    
    func activeteButton(bool : Bool){
        haveRead = bool
        
        let color = bool ? #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let title = bool ? "Readed":"Have Read"
        let titleColor = bool ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) : #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        
        backgroundColor = color
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
    }
}
