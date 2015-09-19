//
//  InstructionsHolderViewController.swift
//  Hi-Ya
//
//  Created by Alan Guilfoyle on 7/11/15.
//  Copyright (c) 2015 Uber Gucci. All rights reserved.
//

import UIKit

class InstructionsHolderViewController: UIViewController
{
	var timer = NSTimer()
	var counter = 0
	@IBOutlet var instructionsContainer: UIView!
	@IBOutlet var scrollView: UIScrollView!
	@IBOutlet var welcomeLabel: UILabel!
	@IBOutlet var youreAwesome: UILabel!

    override func viewDidLoad() 
	{
        super.viewDidLoad()
		
		self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("promptInstructions"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() 
	{
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func promptInstructions()
	{
		counter++
		println("\(counter)")
		if counter == 2
		{
			moveScrollViewForInstructions(800)
			self.timer.invalidate()
		}
		if counter == -99
		{
			self.timer.invalidate()
			performSegueWithIdentifier("premissions", sender: nil)
		}
	}
	
	func dismissSV() 
	{
		counter = -100
	}
	
	func moveScrollViewForInstructions(moveAmount: CGFloat)
	{
		self.scrollView!.setContentOffset(CGPointMake(0, moveAmount), animated: true)
	}
}