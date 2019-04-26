//
//  HomeView.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 26/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class FeedView: UIView {

    var line = UIBezierPath()
    
    func profileLine(){
        line.move(to: .init(x:20, y:80))
        line.addLine(to: .init(x:bounds.width-20, y:80))
        #colorLiteral(red: 0.9567790627, green: 0.9569165111, blue: 0.9567491412, alpha: 1).setStroke()
        line.stroke()
        line.lineWidth = 1
    }
    
    func postLine(){
        line.move(to: .init(x:0, y:445))
        line.addLine(to: .init(x:bounds.width, y:445))
        #colorLiteral(red: 0.8383060694, green: 0.8433454037, blue: 0.8431125283, alpha: 1).setStroke()
        line.stroke()
        line.lineWidth = 1
    }
    
    func postLineButtom(){
        line.move(to: .init(x:10, y:550))
        line.addLine(to: .init(x:bounds.width-10, y:550))
        #colorLiteral(red: 0.8383060694, green: 0.8433454037, blue: 0.8431125283, alpha: 1).setStroke()
        line.stroke()
        line.lineWidth = 1
    }
    
    override func draw (_ rect: CGRect){
        profileLine()
        postLine()
        postLineButtom()
    }

}
