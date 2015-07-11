//
//  LoginViewController.swift
//  Hi-Ya
//
//  Created by Alan Guilfoyle on 7/10/15.
//  Copyright (c) 2015 Uber Gucci. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController 
{
	// *** VARIABLE(S) ***
	var count = 0
	//	 * IBOutlet(s) *
	//uitextfield(s)
	@IBOutlet var usernameTextBox: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var backButtonBarItem: UIBarButtonItem!

    override func viewDidLoad() 
    {
        super.viewDidLoad()

		self.navigationController?.navigationBar.barTintColor = UIColor(red: 0xfe/255, green: 0x5f/255, blue: 0x55/255, alpha: 1.0)
		self.backButtonBarItem.tintColor = UIColor.whiteColor()
//		self.usernameTextBox.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: UIColor.darkGrayColor()])
//		self.passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.darkTextColor()])
	}

    override func didReceiveMemoryWarning() 
    {
        super.didReceiveMemoryWarning()

	}
	
	@IBAction func loginButtonTouched(sender: AnyObject) 
	{		
		let loginAlertController = UIAlertView(title: "Incorrect Password", message: "Your password was incorrect. Please try again.", delegate: self, cancelButtonTitle: "OK")
		
		if count == 0
		{
			loginAlertController.show()
			count = count + 1
		}
		else
		{
			performSegueWithIdentifier("HiYaVC", sender: nil)
		}
	}

	@IBAction func textFieldTouched(sender: AnyObject) 
	{
		if sender.tag == 0
		{
			self.usernameTextBox.placeholder = ""
		}
		else
		{
			self.passwordTextField.placeholder = ""
		}
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
