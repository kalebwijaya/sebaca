//
//  CommentViewController.swift
//  Instabook
//
//  Created by Kaleb Wijaya on 29/04/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit
import CoreData

class CommentViewController: UIViewController, UITextFieldDelegate{
    
    var comments = [Comment]()
    var cdComment = [Comments]()
   
    @IBOutlet weak var addComment: UITextField!
    
    @IBOutlet weak var commentView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        comments = createArray()
        commentView.delegate = self
        commentView.dataSource = self
        self.hideKeyboardWhenTappedAround()
        self.addComment.delegate = self
        commentView.rowHeight = 84
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Comment]{
        var tempArray:[Comment] = []
        let fetchRequest:NSFetchRequest<Comments> = Comments.fetchRequest()
        do {
            let comment = try PresistnceService.context.fetch(fetchRequest)
            self.cdComment = comment
            for i in 0...cdComment.count{
                tempArray.append(Comment(profileImage: UIImage(named:"imageProfile"+"\(cdComment[i].userID)")!, userName: cdComment[i].ueerName!, comment: cdComment[i].comment!))
            }
        } catch {}
        return tempArray
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        let comment = Comments(context: PresistnceService.context)
//        comment.comment = addComment.text
//        comment.likes = Int16(0)
//        comment.userID = Int16(0)
//        comment.ueerName = "Kim Dahyun"
//        PresistnceService.saveContext()
//        self.cdComment.append(comment)
        comments.append(Comment(profileImage: UIImage(named:"profileImage0")!, userName: "Kim Dahyun", comment: addComment.text!))
        self.commentView.reloadData()
        addComment.text = ""
        return true
    }
    
    
    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -280, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -280, up: false)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CommentViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = comments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentViewCell
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width/2
        cell.setComment(comment: comment)
        return cell
    }
}
