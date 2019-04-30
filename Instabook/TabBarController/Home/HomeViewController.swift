//
//  HomeViewController.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 25/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITextFieldDelegate {
    
   
    
    
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var bookCaption: UILabel!
    @IBOutlet weak var totalRead: UILabel!
    @IBOutlet weak var iCarouselView: iCarousel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var haveReadBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    var imageIndex = 0
    var followed:Bool = false
    
    var imgArr = [  UIImage(named:"book0"),
                    UIImage(named:"book1") ,
                    UIImage(named:"book2")]
    
//    var books = [Books]()
    
    var captionArr = ["Overall recommended. Great insight! Inspiring!","This book need more attention","Please read this book and your welcome"]
    var readArr = ["214 peoples", "121 peoples", "187 peoples"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        self.commentField.delegate = self
        
//        comment right icon
//        let rightImage = UIImageView(frame:CGRect( x:0,y:0, width:20, height:20))
//        rightImage.image = UIImage(named:"comment")
//        commentField.rightView = rightImage
//        commentField.rightViewMode = .always
        
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        
        iCarouselView.type = .rotary
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
        
//      Fetch data from core data
//        let fetchRequest:NSFetchRequest<Books> = Books.fetchRequest()
//        do {
//            let books = try PresistnceService.context.fetch(fetchRequest)
//            self.books = books
//            for i in 0...books.count{
//                self.imgArr.append(UIImage(named: "book"+"\(i)"))
//            }
//        } catch {
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -180, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -180, up: false)
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    
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
        imageView.image = imgArr[index]
        return imageView
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        imageIndex = carousel.currentItemIndex
        bookCaption.text = captionArr[carousel.currentItemIndex]
        totalRead.text = readArr[carousel.currentItemIndex]
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
