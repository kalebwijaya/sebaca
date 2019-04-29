//
//  AddReviewSection.swift
//  Instabook
//
//  Created by George Joseph Kristian on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class AddReviewSection: UIView {

    var line = UIBezierPath()
    
    func reviewLineStart(){
        line.move(to: .init(x:10, y:0))
        line.addLine(to: .init(x:bounds.width-10, y:0))
        #colorLiteral(red: 0.8382847905, green: 0.8433461785, blue: 0.843112886, alpha: 1).setStroke()
        line.stroke()
        line.lineWidth = 1
    }
    
    func reviewLineEnd(){
        line.move(to: .init(x:10, y:110))
        line.addLine(to: .init(x:bounds.width-10, y:110))
        #colorLiteral(red: 0.8382847905, green: 0.8433461785, blue: 0.843112886, alpha: 1).setStroke()
        line.stroke()
        line.lineWidth = 1
    }
    
    override func draw (_ rect: CGRect){
        reviewLineStart()
        reviewLineEnd()
    }
}
