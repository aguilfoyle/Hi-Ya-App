//
//  HiYaViewController.swift
//  Hi-Ya
//
//  Created by Alan Guilfoyle on 7/10/15.
//  Copyright (c) 2015 Uber Gucci. All rights reserved.
//

import UIKit

class HiYaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	var timers = NSTimer()
	var timers2 = NSTimer()
	
	@IBOutlet var profileSettingsView: UIView!
	@IBOutlet var generalSettings: UIView!
	@IBOutlet var scrollViewContainer: UIScrollView!
	
	@IBOutlet var tableView: UITableView!
	
	var items: [String] = ["Joe Van Gundy\t\t\t\t\t Steps: 398", "Bruce Broussard\t\t\t\t Steps: 680", "Kristan Altuve\t\t\t\t\t Steps: 998", "Antino Melo\t\t\t\t\t Steps: 2080", "Megan Bertucci\t\t\t\t Steps: 6080"]
	
    override func viewDidLoad() 
	{
        super.viewDidLoad()
		
		self.timers = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("promptNewSteps"), userInfo: nil, repeats: true)
		self.timers = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("promptNewUsers"), userInfo: nil, repeats: true)
		self.navigationController?.navigationBarHidden = true
		
		//Creating a UISwipeGuestureRecongnizer for scrollViewContainer
		var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handSwipes:"))
		var downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handSwipes:"))
		var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handSwipes:"))
		var upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handSwipes:"))
		
		rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
		downSwipe.direction = UISwipeGestureRecognizerDirection.Down
		leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
		upSwipe.direction = UISwipeGestureRecognizerDirection.Up
		
		self.scrollViewContainer.addGestureRecognizer(rightSwipe)
		self.scrollViewContainer.addGestureRecognizer(downSwipe)
		self.scrollViewContainer.addGestureRecognizer(upSwipe)
		self.scrollViewContainer.addGestureRecognizer(leftSwipe)
	}

    override func didReceiveMemoryWarning() 
	{
        super.didReceiveMemoryWarning()

	}
	
	func promptNewSteps()
	{
		
	}
	
	func promptNewUsers()
	{
	
	}
	
	
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 
	{
		var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
		
		cell.textLabel?.text = self.items[indexPath.row]
		cell.textLabel?.font = UIFont(name: "Avenir Next", size: 20)
		
		return cell
	}
	
	
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) 
	{
		//		// Create the alert controller
		var alertController = UIAlertController(title: "Send a Hiya?", message: "😎", preferredStyle: .Alert)
		
		// Create the actions
		var okAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default) {
			UIAlertAction in
			NSLog("OK Pressed")
		}
		var cancelAction = UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel) {
			UIAlertAction in
			NSLog("Cancel Pressed")
		}
		
		// Add the actions
		alertController.addAction(okAction)
		alertController.addAction(cancelAction)
		
		// Present the controller
		self.presentViewController(alertController, animated: true, completion: nil)
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
	{
		return self.items.count
	}
	
	func handSwipes(event: UISwipeGestureRecognizer)
	{
		if event.direction == UISwipeGestureRecognizerDirection.Down
		{
			self.scrollViewContainer.setContentOffset(CGPointMake(0, -800), animated: true)
		}
		else if event.direction == UISwipeGestureRecognizerDirection.Up
		{
			self.scrollViewContainer.setContentOffset(CGPointMake(0, 0), animated: true)
		}
		else if event.direction == UISwipeGestureRecognizerDirection.Left
		{
			self.scrollViewContainer.setContentOffset(CGPointMake(0, 0), animated: true)
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
	
	class MyCustomCell: UITableViewCell 
	{
		@IBOutlet weak var label1: UILabel!
		@IBOutlet weak var label2: UILabel!
		@IBOutlet weak var label3: UILabel!
	}
}