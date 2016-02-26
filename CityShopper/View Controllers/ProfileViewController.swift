//
//  ProfileViewController.swift
//  CityShopper
//
//  Created by Pankaj Khillon on 2/23/16.
//  Copyright © 2016 Sarthak Khillon. All rights reserved.
//

import UIKit
import Parse
import Stripe

class ProfileViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    
    @IBAction func saveInfo(sender: AnyObject) {
        let cardParams: STPCardParams = STPCardParams()
        cardParams.name = nameTextField.text
        cardParams.addressZip = zipTextField.text
    }

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    let paymentTextField = STPPaymentCardTextField()

    func paymentCardTextFieldDidChange(textField: STPPaymentCardTextField) {
        // Toggle navigation, for example
        self.saveButton.enabled = textField.isValid
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.enabled = false
        paymentTextField.frame = CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44)
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
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
