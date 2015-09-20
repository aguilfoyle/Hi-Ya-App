/***************************************************************
* PROJECT: Hi-Ya
* CLASS: InstructionsHolderViewController.swift
*
* Created by Alan Guilfoyle on 7/10/15.
* Copyright (c) 2015 Think Thrice Tech. All rights reserved.
***************************************************************/

// *** IMPORT(S) ***
import UIKit



/***************************************************************
* CLASS: InstructionsHolderViewController | 
*		IMPORTED: UIViewController
* PURPOSE: This class is the viewcontroller for holding the 
*		InstructionsViewController.swift viewController. 
***************************************************************/
class InstructionsHolderViewController: UIViewController
{
	// *** VARIABLE(S) ***
	//Integer(s)
	var counter = 0
	//NSTimer(s)
	var timer = NSTimer()
	//UIView(s)
	@IBOutlet var instructionsContainer: UIView!
	//UIScrollView(s)
	@IBOutlet var scrollView: UIScrollView!
	//UILabel(s)
	@IBOutlet var welcomeLabel: UILabel!
	@IBOutlet var youreAwesome: UILabel!

	
	
	// MARK: - Override Functions
	/***************************************************************
	* FUNC: viewDidLoad | PARAM: None | RETURN: Void 
	* PURPOSE: This method is called after the view controller has 
	*		loaded its view hierarchy into memory.
	***************************************************************/
	override func viewDidLoad() 
	{
        super.viewDidLoad()
		
		self.timer = NSTimer.scheduledTimerWithTimeInterval( 1, target: self, selector: Selector( "promptInstructions" ), userInfo: nil, repeats: true )
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
    
	
	
	// MARK: - Standard Functions
	/***************************************************************
	* FUNC: promptInstructions | PARAM: None | RETURN: Void 
	* PURPOSE: Asks the data source for a cell to insert in a 
	*		particular location of the table view.
	***************************************************************/
	func promptInstructions()
	{
		//Increase counter by 1
		self.counter++
		
		//If the counter equals 2: stop timer; call
		//	moveScrollViewForInstructions
		if counter == 2
		{
			moveScrollViewForInstructions( 800 )
			self.timer.invalidate()
		}
		
		//If counter equals -99: stop timer; perform a segue
		if counter == -99
		{
			self.timer.invalidate()
			performSegueWithIdentifier( "premissions", sender: nil )
		}
	}
	
	
	
	/***************************************************************
	* FUNC: dismissSV | PARAM: None | RETURN: Void 
	* PURPOSE: When called this function will set the counter 
	*		variable to -100.
	***************************************************************/
	func dismissSV() 
	{
		counter = -100
	}
	
	
	
	/***************************************************************
	* FUNC: moveScrollViewForInstructions | PARAM: CGFloat | 
	* RETURN: Void 
	* PURPOSE: When called this function will take in a CGFloat and
	*		use the value to move the scrollView by that much.
	***************************************************************/
	func moveScrollViewForInstructions( moveAmount: CGFloat )
	{
		self.scrollView!.setContentOffset( CGPointMake( 0, moveAmount ), animated: true )
	}
}