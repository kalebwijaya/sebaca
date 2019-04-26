//
//  HomeViewController.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 25/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var bookCaption: UILabel!
    @IBOutlet weak var totalRead: UILabel!
    @IBOutlet weak var iCarouselView: iCarousel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var haveReadBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    var imageIndex = 0
    
    var imgArr = [  UIImage(named:"book1"),
                    UIImage(named:"book2") ,
                    UIImage(named:"book3")]
    
    var captionArr = ["Overall recommended. Great insight! Inspiring!","This book need more attention","Please read this book and your welcome"]
    var readArr = ["214 peoples", "121 peoples", "187 peoples"]

    override func viewDidLoad() {
        super.viewDidLoad()
        haveReadBtn.layer.borderWidth = 2
        haveReadBtn.layer.borderColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        saveBtn.layer.borderWidth = 2
        saveBtn.layer.borderColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        let image = UIImage(named: "save")?.withRenderingMode(.alwaysTemplate)
        saveBtn.setImage(image, for: .normal)
        saveBtn.imageView!.tintColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        
        iCarouselView.type = .rotary
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
        // Do any additional setup after loading the view.
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

extension HomeViewController: iCarouselDelegate, iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        imageIndex = index
        imageView.image = imgArr[index]
        return imageView
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        bookCaption.text = captionArr[carousel.currentItemIndex]
        totalRead.text = readArr[carousel.currentItemIndex]
    }
}


