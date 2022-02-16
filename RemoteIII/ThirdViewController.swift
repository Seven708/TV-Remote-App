//
//  ThirdViewController.swift
//  RemoteIII
//
//  Created by Jeremiah Johnson on 5/19/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var third: UIView!
    
    @IBOutlet weak var buttonOutlet: UISegmentedControl!
    @IBOutlet weak var labelOutlet: UITextField!
    @IBOutlet weak var channelOutlet: UILabel!
    @IBOutlet weak var cancelChange: UIButton!
    @IBOutlet weak var saveChange: UIButton!
    
    
    @IBAction func backgroundTouched(sender: UIControl) {
        labelOutlet.resignFirstResponder()
    }
    
   
    @IBAction func favChannel(sender: UISegmentedControl) {
        var station = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        channelOutlet.text = station
        if station == "1" {
            channelOutlet.text == buttonOutlet
        }
        if station == "2" {
            channelOutlet.text == station
        }
        if station == "3" {
            channelOutlet.text == buttonOutlet
        }
        if station == "4" {
            channelOutlet.text == channelOutlet
            
        }
    }
    
    @IBAction func favChannelLabel(sender: UITextField) {
        //sender.resignFirstResponder()
        
    }

    
    @IBAction func channelChanger(sender: UIStepper){
        channelOutlet.text = " \(Int(sender.value))"
    }
    
    @IBAction func cancelChange(sender: UIButton) {
        labelOutlet.text = " "
        channelOutlet.text = " "
    }
    
    @IBAction func saveChange(sender: UIButton) {
        var message = "No letters less than 3 or more than 4 in Label text can be saved for Buttton"
        let title = "Favorite Channel"
        let alertController = UIAlertController(title: title,
            message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK",
            style: .Cancel, nil)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true,
            completion: nil)
    /*
        switch (self.buttonOutlet.selectedSegmentIndex)
        {
        case 0:
            self.channelOutle.text == favChannel[:];
            break;
        case 1:
            self.channelOutle.text == favChannel[:];
            break;
        case 2:
            self.channelOutle.text == favChannel[:];
            break;
        case 3:
            self.channelOutle.text == favChannel[:];
            break;
        default:
            break; 
        }
        */
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        labelOutlet.delegate = self
        buttonOutlet.selectedSegmentIndex = 0
        
        // Do any additional setup after loading the view.
        
    }
            
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool
    {
        let maxLength = 4
        let currentString: NSString = textField.text
        let newString: NSString =
        currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
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
