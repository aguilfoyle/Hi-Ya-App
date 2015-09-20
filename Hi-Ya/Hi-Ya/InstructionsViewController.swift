/***************************************************************
*   PROJECT: Hi-Ya
*	CLASS: InstructionsViewController.swift
*
*   Created by Alan Guilfoyle on 7/10/15.
*   Copyright (c) 2015 Think Thrice Tech. All rights reserved.
***************************************************************/

// *** IMPORT(S) ***
import UIKit



/***************************************************************
* CLASS: InstructionsViewController | IMPORTED: UIViewController
* PURPOSE: This class is the viewcontroller for handling the 
*		prompt of the instructions / user agreement for allowing
*		me to use their healthKit information.
***************************************************************/
class InstructionsViewController: UIViewController 
{	
	// *** VARIABLE(S) ***
	//UILabel(s)
	@IBOutlet var lebel1: UILabel!
	@IBOutlet var label2: UILabel!
	@IBOutlet var label3: UILabel!
	//UIScrollView(s)
	@IBOutlet var scrollView: UIScrollView!
	//UIView(s)
	@IBOutlet var instructionsView1: UIView!
	@IBOutlet var instructionsView2: UIView!
	@IBOutlet var instructionsView3: UIView!
	
	
	
	// MARK: - Override Functions
	/***************************************************************
	* FUNC: viewDidLoad | PARAM: None | RETURN: Void 
	* PURPOSE: This method is called after the view controller has 
	*		loaded its view hierarchy into memory.
	***************************************************************/
    override func viewDidLoad() 
	{
        super.viewDidLoad()
		
		self.lebel1.layer.cornerRadius = 5
		self.label2.layer.cornerRadius = 5
		self.label3.layer.cornerRadius = 5
		
		self.lebel1.layer.masksToBounds = true
		self.label2.layer.masksToBounds = true
		self.label3.layer.masksToBounds = true
		
        let swipeLeft1 = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe1:"))
		let swipeLeft2 = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe2:"))
		
		swipeLeft1.direction = UISwipeGestureRecognizerDirection.Left
		swipeLeft2.direction = UISwipeGestureRecognizerDirection.Left
		
		self.instructionsView1.addGestureRecognizer(swipeLeft1)
		self.instructionsView2.addGestureRecognizer(swipeLeft2)
		
		self.lebel1.backgroundColor = UIColor.blackColor()
		self.label2.backgroundColor = UIColor.whiteColor()
		self.label3.backgroundColor = UIColor.whiteColor()
    }

	
	
	/***************************************************************
	* FUNC: didReceiveMemoryWarning | PARAM: None | RETURN: Void 
	* PURPOSE: Sent to the view controller when the app receives a 
	*		memory warning.
	***************************************************************/
    override func didReceiveMemoryWarning() 
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	
	
	/***************************************************************
	* FUNC: prepareForSegue | PARAM: AnyObject | RETURN: Void 
	* PURPOSE:  Notifies the view controller that a segue is about 
	*		to be performed.
	***************************************************************/
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) 
	{
		if segue.identifier == "DelegateDismiss" 
		{
			var viewControllerB = segue.destinationViewController as! InstructionsHolderViewController
			viewControllerB.dismissSV()
		}
	}
	
	
	
	// MARK: - Standard Functions
	/***************************************************************
	* FUNC: handleSwipe1 | PARAM: UISwipeGestureRecognizer | 
	* RETURN: Void 
	* PURPOSE: This function will hand recieving swipe gestures made
	*		by the user.
	***************************************************************/
	func handleSwipe1(event: UISwipeGestureRecognizer)
	{
		if event.direction == UISwipeGestureRecognizerDirection.Left
		{
			println("1")
			self.label2.backgroundColor = UIColor.blackColor()
			self.lebel1.backgroundColor = UIColor.whiteColor()
			self.label3.backgroundColor = UIColor.whiteColor()
			self.scrollView.setContentOffset(CGPointMake(341, 0), animated: true)
		}
	}
	
	
	
	/***************************************************************
	* FUNC: handleSwipe2 | PARAM: UISwipeGestureRecognizer | 
	* RETURN: Void 
	* PURPOSE: This function will hand recieving swipe gestures made
	*		by the user. 
	***************************************************************/
	func handleSwipe2(event: UISwipeGestureRecognizer)
	{
		if event.direction == UISwipeGestureRecognizerDirection.Left
		{
			println("2")
			self.label3.backgroundColor = UIColor.whiteColor()
			self.lebel1.backgroundColor = UIColor.blackColor()
			self.label2.backgroundColor = UIColor.blackColor()
			self.scrollView.setContentOffset(CGPointMake(682, 0), animated: true)
		}
	}

	
	
	// MARK: - IBAction Functions
	/***************************************************************
	* FUNC: dismissSVButtonClicked | PARAM: AnyObject | RETURN: Void 
	* PURPOSE: When pressed this will trigger a segue to begin.
	***************************************************************/
	@IBAction func dismissSVButtonClicked(sender: AnyObject) 
	{		
		self.performSegueWithIdentifier("DelegateDismiss", sender: self)
	}
	
	
	
	/***************************************************************
	* FUNC: testButtonClicked | PARAM: AnyObject | RETURN: Void 
	* PURPOSE: When pressed this will trigger the movement of the 
	*		scrollView. It will animate and move -800 on the y axis.
	***************************************************************/
	@IBAction func testButtonClicked(sender: AnyObject) 
	{
		self.scrollView.setContentOffset(CGPointMake(341, 0), animated: true)
	}
}