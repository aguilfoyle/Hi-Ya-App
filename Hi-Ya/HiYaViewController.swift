//
//  HiYaViewController.swift
//  Hi-Ya
//
//  Created by Alan Guilfoyle on 7/10/15.
//  Copyright (c) 2015 Uber Gucci. All rights reserved.
//

import UIKit

class HiYaViewController: UIViewController 
{
	@IBOutlet var profileSettingsView: UIView!
	@IBOutlet var generalSettings: UIView!
	@IBOutlet var scrollViewContainer: UIScrollView!
	
	
    override func viewDidLoad() 
	{
        super.viewDidLoad()
		
		self.navigationController?.navigationBarHidden = true
		
		//Creating a UISwipeGuestureRecongnizer for scrollViewContainer
		var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handSwipes:"))
		var downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handSwipes:"))
		
		rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
		downSwipe.direction = UISwipeGestureRecognizerDirection.Down
		
		self.scrollViewContainer.addGestureRecognizer(rightSwipe)
		self.scrollViewContainer.addGestureRecognizer(downSwipe)
	}

    override func didReceiveMemoryWarning() 
	{
        super.didReceiveMemoryWarning()

	}
	
	func handSwipes(event: UISwipeGestureRecognizer)
	{
		if event.direction == UISwipeGestureRecognizerDirection.Down
		{
			self.scrollViewContainer.setContentOffset(CGPointMake(0, -800), animated: true)
		}
		else
		{
			self.scrollViewContainer.setContentOffset(CGPointMake(-220, 0), animated: true)
		}
	}
	
	@IBAction func menuButtonTouched(sender: AnyObject) 
	{
		self.scrollViewContainer.setContentOffset(CGPointMake(-220, 0), animated: true)
	}
	
	@IBAction func palsButtonTouched(sender: AnyObject) 
	{
		self.scrollViewContainer.setContentOffset(CGPointMake(0, -800), animated: true)
	}
}