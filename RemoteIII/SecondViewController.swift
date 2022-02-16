//
//  SecondViewController.swift
//  RemoteIII
//
//  Created by Jeremiah Johnson on 5/19/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dvrPowerOutlet: UILabel!
    @IBOutlet weak var dvrStateOutlet: UILabel!
    
    @IBOutlet weak var playOutlet: UIButton!
    @IBOutlet weak var stopOutlet: UIButton!
    @IBOutlet weak var pauseOutlet: UIButton!
    @IBOutlet weak var fastFOutlet: UIButton!
    @IBOutlet weak var fastROutlet: UIButton!
    @IBOutlet weak var recordOutlet: UIButton!
    
    @IBOutlet weak var leftSide: UISwitch!
    @IBOutlet weak var rightSide: UISwitch!
    
    
    @IBAction func dvrPower(sender: UISwitch) {
        dvrPowerOutlet.text = "Stopped"
        dvrPowerOutlet.text = " " + (sender.on ? "On" : "Off")
        //leftSide.on = sender.on
        //rightSide.on = sender.on
        leftSide.setOn(sender.on, animated: true)
        rightSide.setOn(sender.on, animated: true)
    }
    
    
    @IBAction func playButton(sender: UIButton) {
        dvrStateOutlet.text = "Playing..."
    }
    
    @IBAction func stopButton(sender: UIButton) {
        playOutlet.enabled = true
        pauseOutlet.enabled = true
        fastFOutlet.enabled = true
        fastROutlet.enabled = true
        dvrStateOutlet.text = "Stopped"
    }
    
    @IBAction func pauseButton(sender: UIButton) {
        dvrStateOutlet.text = "Paused"
    }
    
    @IBAction func fastFwd(sender: UIButton) {
        dvrStateOutlet.text = "<< Forward 10x..."
    }
    
    @IBAction func fastRwd(sender: UIButton) {
        dvrStateOutlet.text = ">> Rewinding 20x.."
    }
 
    @IBAction func recordButton(sender: UIButton) {
        playOutlet.enabled = false
        pauseOutlet.enabled = false
        fastFOutlet.enabled = false
        fastROutlet.enabled = false
        dvrStateOutlet.text = "Recording..."
    }
    
    @IBAction func mainPower(sender: UISegmentedControl) {
        let enabled = (sender.selectedSegmentIndex == 0)
        dvrPowerOutlet.enabled = enabled
        dvrStateOutlet.enabled = enabled
        playOutlet.enabled = enabled
        stopOutlet.enabled = enabled
        pauseOutlet.enabled = enabled
        fastFOutlet.enabled = enabled
        fastROutlet.enabled = enabled
        recordOutlet.enabled = enabled
        leftSide.enabled = enabled
    }
    
    
    @IBAction func recordAlert(sender: AnyObject) {
            let title = "DVR is Recording...."
            let message = "DVR is currently\([recordButton])"
            let alertController = UIAlertController(title: title,
                message: message, preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel",
                style: .Destructive) { action in let cancelController = UIAlertController(
                    title: "No Problem", message: "You can continue recording ",
                    preferredStyle: .Alert)
                    let okayAction = UIAlertAction(title: "Okay",
                        style: .Default, nil)
                    cancelController.addAction(okayAction)
                    self.presentViewController(cancelController,
                        animated: true, completion: nil)}
            let confirmAction = UIAlertAction(title: "Confirm",
                style: .Default) { action in let okayController = UIAlertController(
                    title: "Done!", message: "DVR has been Stopped",
                    preferredStyle: .Alert)
                    let okayAction = UIAlertAction(title: "Okay",
                        style: .Default, nil)
                    okayController.addAction(okayAction)
                    self.presentViewController(okayController,
                        animated: true, completion: nil)}
            alertController.addAction(cancelAction)
            alertController.addAction(confirmAction)
            presentViewController(alertController, animated: true,
                completion: nil)
        
        /*var alertController:UIAlertController?
        alertController = UIAlertController(title: "DVR is Recording...",
            message: "Select Option",
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel",style:UIAlertActionStyle.Cancel,handler: nil)
        
        let stopAction = UIAlertAction(title: "Stop DVR",style: UIAlertActionStyle.Default,handler: {(paramAction:UIAlertAction!) in
                self.dvrStateOutlet.text = "Stopped"})
        
        
        let okayController = UIAlertController(
            title: "DVR Stopped!", message:"The DVR has Stopped Recording",preferredStyle: .Alert)
        
        alertController!.addAction(cancelAction)
        alertController!.addAction(stopAction)
        self.presentViewController(alertController!,
            animated: true,
            completion: nil)
        */
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

