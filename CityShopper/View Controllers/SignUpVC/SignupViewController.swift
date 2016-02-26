//
//  SignupViewController.swift
//  CityShopper
//
//  Created by Pankaj Khillon on 2/23/16.
//  Copyright © 2016 Sarthak Khillon. All rights reserved.
//

import UIKit
import Parse


class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        let username = self.usernameField.text
        let password = self.passwordField.text
        let email = self.emailField.text
        let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        // Validate the text fields
        if username?.characters.count < 5 {
            let alert = UIAlertController(title: "Invalid", message: "Username must be greater than 5 characters", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if password?.characters.count < 8 {
            let alert = UIAlertController(title: "Invalid", message: "Password must be greater than 8 characters", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if email?.characters.count < 8 {
            let alert = UIAlertController(title: "Invalid", message: "Please enter a valid email address", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            // Run a spinner to show a task in progress
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            let newUser = PFUser()
            
            newUser.username = username
            newUser.password = password
            newUser.email = finalEmail
            
            // Sign up the user asynchronously
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                
                // Stop the spinner
                spinner.stopAnimating()
                if ((error) != nil) {
                    let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
                    }))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                } else {
                    let alert = UIAlertController(title: "Success", message: "Signed up!", preferredStyle: .Alert)
                    self.presentViewController(alert, animated: true, completion: nil)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
                    }))
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController: StartViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Start") as! StartViewController
                        self.presentViewController(viewController, animated: true, completion: nil)
                    })
                }
            })
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
