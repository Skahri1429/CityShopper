//
//  LoginViewController.swift
//  CityShopper
//
//  Created by Pankaj Khillon on 2/23/16.
//  Copyright © 2016 Sarthak Khillon. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!

    @IBAction func unwindToLogInScreen(segue:UIStoryboardSegue) {
    
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        let username = self.usernameField.text
        let password = self.passwordField.text
        
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
            
        } else {
            // Run a spinner to show a task in progress
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            // Send a request to login
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
                
                // Stop the spinner
                spinner.stopAnimating()
                
                if ((user) != nil) {
                    let alert = UIAlertController(title: "Success", message: "Logged In", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in }))
                    self.presentViewController(alert, animated: true, completion: nil)
                    let viewController: StartViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Start") as! StartViewController
                    self.presentViewController(viewController, animated: true, completion: nil)
                    
                    
                } else {
                    let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in }))
                    self.presentViewController(alert, animated: true, completion: nil)
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
