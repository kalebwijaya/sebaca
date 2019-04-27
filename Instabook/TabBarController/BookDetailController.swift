//
//  BookDetailController.swift
//  Instabook
//
//  Created by George Joseph Kristian on 26/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class BookDetailController: UIViewController {
    
    @IBOutlet weak var ratingValue: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var segmentedControllerSummaryReviews: UISegmentedControl!
    @IBOutlet weak var viewSummary: UIView!
    @IBOutlet weak var viewReviews: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewReviews.isHidden = true
        viewSummary.isHidden = false
        
        authorImage.layer.cornerRadius = authorImage.frame.size.width/2
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func segmentedControllSummaryReviewsTapped(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            viewReviews.isHidden = true
            viewSummary.isHidden = false
            break;
        case 1:
            viewReviews.isHidden = false
            viewSummary.isHidden = true
            break;
        default:
            viewReviews.isHidden = true
            viewSummary.isHidden = false
            break;
            
        }
    }
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
