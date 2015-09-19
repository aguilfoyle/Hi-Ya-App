//
//  InstructionsViewController.swift
//  Hi-Ya
//
//  Created by Alan Guilfoyle on 7/10/15.
//  Copyright (c) 2015 Uber Gucci. All rights reserved.
//

import UIKit


class InstructionsViewController: UIViewController 
{	
	//var delegate: DetailsDelegate!
	@IBOutlet var lebel1: UILabel!
	@IBOutlet var label2: UILabel!
	@IBOutlet var label3: UILabel!
	@IBOutlet var scrollView: UIScrollView!
	@IBOutlet var instructionsView1: UIView!
	@IBOutlet var instructionsView2: UIView!
	@IBOutlet var instructionsView3: UIView!
	
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

    override func didReceiveMemoryWarning() 
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

	@IBAction func dismissSVButtonClicked(sender: AnyObject) 
	{		
		self.performSegueWithIdentifier("DelegateDismiss", sender: self)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) 
	{
		if segue.identifier == "DelegateDismiss" 
		{
			var viewControllerB = segue.destinationViewController as! InstructionsHolderViewController
			viewControllerB.dismissSV()
		}
	}
	
	@IBAction func testButtonClicked(sender: AnyObject) 
	{
		self.scrollView.setContentOffset(CGPointMake(341, 0), animated: true)
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
