/***************************************************************
*  PROJECT: Hi-Ya
*	CLASS: HiYaViewController.swift
*
*  Created by Alan Guilfoyle on 7/10/15.
*  Copyright (c) 2015 Think Thrice Tech. All rights reserved.
***************************************************************/

// *** IMPORT(S) ***
import UIKit



/***************************************************************
* CLASS: HiYaViewController | IMPORTED: UIViewController, 
*		UITableViewDelegate & UITableViewDataSource
* PURPOSE: This class is the viewcontroller for the first screen
*		that the user sees when the app is launched.
***************************************************************/
class HiYaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	// *** VARIABLE(S) ***
	//NSTimer(s)
	var timers = NSTimer()
	var timers2 = NSTimer()
	//UIView(s)
	@IBOutlet var profileSettingsView: UIView!
	@IBOutlet var generalSettings: UIView!
	//UIScrollView(s)
	@IBOutlet var scrollViewContainer: UIScrollView!
	//UITableView(s)
	@IBOutlet var tableView: UITableView!
	//Array(s): String
	var items: [String] = ["Joe Van Gundy\t\t\t\t\t Steps: 398", "Bruce Broussard\t\t\t\t Steps: 680", "Kristan Altuve\t\t\t\t\t Steps: 998", "Antino Melo\t\t\t\t\t Steps: 2080", "Megan Bertucci\t\t\t\t Steps: 6080"]
	
	
	
	// MARK: - Override Functions
	/***************************************************************
	* FUNC: viewDidLoad | PARAM: None | RETURN: Void 
	* PURPOSE: This method is called after the view controller has 
	*		loaded its view hierarchy into memory.
	***************************************************************/
    override func viewDidLoad() 
	{
        super.viewDidLoad()
		
		self.timers = NSTimer.scheduledTimerWithTimeInterval( 1, target: self, selector: Selector( "promptNewSteps" ), userInfo: nil, repeats: true )
		self.timers = NSTimer.scheduledTimerWithTimeInterval( 1, target: self, selector: Selector( "promptNewUsers" ), userInfo: nil, repeats: true )
		self.navigationController?.navigationBarHidden = true
		
		//Creating a UISwipeGuestureRecongnizer for scrollViewContainer
		var rightSwipe = UISwipeGestureRecognizer( target: self, action: Selector( "handSwipes:" ))
		var downSwipe = UISwipeGestureRecognizer( target: self, action: Selector( "handSwipes:" ))
		var leftSwipe = UISwipeGestureRecognizer( target: self, action: Selector( "handSwipes:" ))
		var upSwipe = UISwipeGestureRecognizer( target: self, action: Selector( "handSwipes:" ))
		
		//Adding directions to the UISwipeGestures
		rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
		downSwipe.direction = UISwipeGestureRecognizerDirection.Down
		leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
		upSwipe.direction = UISwipeGestureRecognizerDirection.Up
		
		//Adding the Gestures to the Views
		self.scrollViewContainer.addGestureRecognizer( rightSwipe )
		self.scrollViewContainer.addGestureRecognizer( downSwipe )
		self.scrollViewContainer.addGestureRecognizer( upSwipe )
		self.scrollViewContainer.addGestureRecognizer( leftSwipe )
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
	
	
	
	// MARK: - Standard Functions
	func promptNewSteps()
	{
		
	}
	
	func promptNewUsers()
	{
	
	}
	
	
	
	/***************************************************************
	* FUNC: tableView | PARAM: UITableView, NSIndexPath | 
	* RETURN: UITableViewCell 
	* PURPOSE: Asks the data source for a cell to insert in a 
	*		particular location of the table view.
	***************************************************************/
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell 
	{
		var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
		
		cell.textLabel?.text = self.items[indexPath.row]
		cell.textLabel?.font = UIFont(name: "Avenir Next", size: 20)
		
		return cell
	}
	
	
	
	/***************************************************************
	* FUNC: viewDidLoad | PARAM: None | RETURN: Void 
	* PURPOSE: Tells the delegate that the specified row is now 
	*		selected.
	***************************************************************/
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
	
	
	
	/***************************************************************
	* FUNC: tableView | PARAM: UITableView, Int | RETURN: Int 
	* PURPOSE: Tells the data source to return the number of rows 
	*		in a given section of a table view.
	***************************************************************/
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
	{
		return self.items.count
	}
	
	
	
	/***************************************************************
	* FUNC: handSwipes | PARAM: UISwipeGestureRecognizer | 
	* RETURN: Void 
	* PURPOSE: This method is used to handle Swipe gestures made by 
	*		the user; It takes in its parameter a 
	*		UISwipeGestureRecognizer; One of the properties of this 
	*		parameter is to pull out a direction.
	***************************************************************/
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
	
	
	
	// MARK: - IBAction Functions
	/***************************************************************
	* FUNC: menuButtonTouched | PARAM: AnyObject | RETURN: Void 
	* PURPOSE: When pressed this will trigger the movement of the 
	*		scrollView. It will animate and move -800 on the y axis.
	***************************************************************/
	@IBAction func menuButtonTouched(sender: AnyObject) 
	{
		self.scrollViewContainer.setContentOffset(CGPointMake(-220, 0), animated: true)
	}

	
	
	/***************************************************************
	* FUNC: palsButtonTouched | PARAM: AnyObject | RETURN: Void 
	* PURPOSE: This function controls the movement of the scrollView
	*		When pressed the view will animate and move -800 on the 
	*		y axis. 
	***************************************************************/
	@IBAction func palsButtonTouched(sender: AnyObject) 
	{
		self.scrollViewContainer.setContentOffset(CGPointMake(0, -800), animated: true)
	}
	
	
	
	// Mark: - Extra Class
	/***************************************************************
	* CLASS: HiYaViewController | IMPORTED: UITableViewCell,
	* PURPOSE: Used to customize my cells; However it was discarded
	*		later during the coding process;
	***************************************************************/
	class MyCustomCell: UITableViewCell 
	{
		@IBOutlet weak var label1: UILabel!
		@IBOutlet weak var label2: UILabel!
		@IBOutlet weak var label3: UILabel!
	}
}