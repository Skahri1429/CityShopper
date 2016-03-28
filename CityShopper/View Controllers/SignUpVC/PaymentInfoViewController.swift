//
//  PaymentInfoViewController.swift
//  CityShopper
//
//  Created by Pankaj Khillon on 3/11/16.
//  Copyright © 2016 Sarthak Khillon. All rights reserved.
//

import UIKit
import Stripe

class PaymentInfoViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    
    let paymentTextField = STPPaymentCardTextField()

    @IBAction func save(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        paymentTextField.frame = CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44)
        paymentTextField.delegate = self
        paymentTextField.center = self.view.center
        view.addSubview(paymentTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        paymentTextField.frame = CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44)
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
    }
    
    func paymentCardTextFieldDidChange(textField: STPPaymentCardTextField) {
        // Toggle navigation, for example
        saveButton.enabled = textField.valid
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
