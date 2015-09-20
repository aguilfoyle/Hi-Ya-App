/***************************************************************
* PROJECT: Hi-Ya
* CLASS: LoginViewController.swift
*
* Created by Alan Guilfoyle on 7/10/15. 
* Copyright (c) 2015 Think Thrice Tech. All rights reserved.
***************************************************************/

// *** IMPORT(S) ***
import UIKit



/***************************************************************
* CLASS: LoginViewController | IMPORTED: UIViewController, 
*		UITableViewDelegate & UITableViewDataSource
* PURPOSE: This class will handle the logging in function from 
*		the user; At the moment the class isn't used since this
*		function isn't high priority for the hack-a-thon.
***************************************************************/
class LoginViewController: UIViewController 
{
	// *** VARIABLE(S) ***
	//Integer(s)
	var count = 0
	//UITextField(s)
	@IBOutlet var usernameTextBox: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	//UIBarButtonItem(s)
	@IBOutlet var backButtonBarItem: UIBarButtonItem!
	
	
	
	// MARK: - Override Functions
	/***************************************************************
	* FUNC: viewDidLoad | PARAM: None | RETURN: Void 
	* PURPOSE: This method is called after the view controller has 
	*		loaded its view hierarchy into memory.
	***************************************************************/
	override func viewDidLoad() 
	{
		super.viewDidLoad()
		
		self.navigationController?.navigationBar.barTintColor = UIColor(red: 0xfe/255, green: 0x5f/255, blue: 0x55/255, alpha: 1.0)
		self.backButtonBarItem.tintColor = UIColor.whiteColor()
		
	}
	
	
	
	/***************************************************************
	* FUNC: didReceiveMemoryWarning | PARAM: None | RETURN: Void 
	* PURPOSE: Sent to the view controller when the app receives a 
	*		memory warning.
	***************************************************************/
	override func didReceiveMemoryWarning() 
	{
		super.didReceiveMemoryWarning()
		
	}
	
	
	
	// MARK: - IBAction Functions
	/***************************************************************
	* FUNC: loginButtonTouched | PARAM: AnyObject | RETURN: Void 
	* PURPOSE: When pressed log the user in if the correct fields
	*		are filled out.
	***************************************************************/
	@IBAction func loginButtonTouched(sender: AnyObject) 
	{		
		//let loginAlertController = UIAlertView(title: "Incorrect Password", message: "Your password was incorrect. Please try again.", delegate: self, cancelButtonTitle: "OK")
		
		if count == 0
		{
			//loginAlertController.show()
			count = count + 1
		}
		else
		{
			performSegueWithIdentifier("instructions", sender: nil)
		}
	}
	
	
	
	/***************************************************************
	* FUNC: textFieldTouched | PARAM: AnyObject | RETURN: Void 
	* PURPOSE: When pressed this will save the values stored in the
	*		text fields.
	***************************************************************/
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
}