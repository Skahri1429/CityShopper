//
//  ProfileViewController.swift
//  CityShopper
//
//  Created by Pankaj Khillon on 2/23/16.
//  Copyright © 2016 Sarthak Khillon. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {
    
    @IBAction func next(sender: AnyObject) {
        guard let fName = firstNameTextField.text else {
            _ = ""
            return
        }
        guard let lName = lastNameTextField.text else {
            _ = ""
            return
        }
        guard let zCode = zipCodeTextField.text else {
            _ = ""
            return
        }
        
        
        let currentUser = PFObject(className: "User")
        currentUser["firstName"] = fName
        currentUser["lastName"] = lName
        currentUser["ZipCode"] = zCode
        
        currentUser.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if success {
                print("Successful save")
            }
            else {
                print("failed")
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
