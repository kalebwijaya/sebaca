//
//  BookDetailController.swift
//  Instabook
//
//  Created by George Joseph Kristian on 26/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class BookDetailController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var tableViewReview: UITableView!
    @IBOutlet weak var ratingValue: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var segmentedControllerSummaryReviews: UISegmentedControl!
    @IBOutlet weak var viewSummary: UIView!
    @IBOutlet weak var viewReviews: UIView!
    @IBOutlet weak var addComment: UITextField!
    @IBOutlet weak var addCommentBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    var comment : String = " "
    
    var reviews : [Review] = []
    
    var userImageArr = [  #imageLiteral(resourceName: "user0"),
    #imageLiteral(resourceName: "user1"),
    #imageLiteral(resourceName: "user2")]
    var nameArr = ["Jerome Polin","Maudy Ayunda","Raditya Dika"]
    var commentArr = ["Mantapu Jiwa, Sukak","This is my favorite book","Inilah buku terbaik menurut gue"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        self.addComment.delegate = self
        
        saveBtn.layer.borderWidth = 2
        saveBtn.layer.borderColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        
        let image = UIImage(named: "save")?.withRenderingMode(.alwaysTemplate)
        saveBtn.setImage(image, for: .normal)
        saveBtn.imageView!.tintColor = #colorLiteral(red: 0.218891561, green: 0.5776638985, blue: 0.866191566, alpha: 1)
        
        viewReviews.isHidden = true
        viewSummary.isHidden = false
        
        authorImage.layer.cornerRadius = authorImage.frame.size.width/2
        
        addCommentBtn.isEnabled = false
        
        reviews = createArray()
        if(!addCommentBtn.isEnabled){
            addCommentBtn.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }else{
            addCommentBtn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
    }
    
    @IBAction func addComment(_ sender: Any) {
        if(addComment.text != ""){
            nameArr.append("Patrick")
            userImageArr.append(#imageLiteral(resourceName: "profile"))
            commentArr.append(addComment.text!)
            reviews = createArray()
            tableViewReview.reloadData()
        }
    }
    
    func createArray() -> [Review] {
        var tempReviews : [Review] = []
        
        let reviewCount = nameArr.count - 1
        
        for i in 0...reviewCount{
            tempReviews.append(Review(userImage: userImageArr[i], userName: nameArr[i], userComment: commentArr[i]))
        }
    
        return  tempReviews
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -200, up: true)
        addCommentBtn.isEnabled = true
        if(!addCommentBtn.isEnabled){
            addCommentBtn.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }else{
            addCommentBtn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -200, up: false)
        if(addComment.text!==""){
            addCommentBtn.isEnabled = false
        }else{
            addCommentBtn.isEnabled = true
        }
        if(!addCommentBtn.isEnabled){
            addCommentBtn.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }else{
            addCommentBtn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
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

// extension for every review template
extension BookDetailController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let review = reviews[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell") as! ReviewCell
        
        cell.setReview(review: review)
        
        return cell
    }
}
