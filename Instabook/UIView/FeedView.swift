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
    
    func graph(){
        line.move(to: .init(x:20, y:75))
        line.addLine(to: .init(x:bounds.width-20, y:75))
        #colorLiteral(red: 0.9567790627, green: 0.9569165111, blue: 0.9567491412, alpha: 1).setStroke()
        line.stroke()
        line.lineWidth = 2
    }
    
    override func draw (_ rect: CGRect){
        graph()
    }

}
