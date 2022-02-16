//
//  FirstViewController.swift
//  RemoteIII
//
//  Created by Jeremiah Johnson on 5/19/15.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var tvPower: UILabel!
    @IBOutlet weak var speakerVolume: UILabel!
    @IBOutlet weak var currentChannel: UILabel!
    var typedNum = false
    
    
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var volSliderOutlet: UISlider!
    @IBOutlet weak var channelsOutlet: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    @IBOutlet weak var favOutlet: UISegmentedControl!
    @IBOutlet weak var channelUpDownOut: UIStepper!
    @IBOutlet weak var clear: UIButton!

    
    @IBAction func powerSwitch(sender: UISwitch) {
        tvPower.text = " " + (sender.on ? "On": "Off")
        //leftSwitch.on = sender.on
        //rightSwitch.on = sender.on
        leftSwitch.setOn(sender.on,animated: true)
        rightSwitch.setOn(sender.on, animated: true)
    }

   
    @IBAction func volumeControl(sender: UISlider) {
        var currentValue = Int(sender.value)
        
        speakerVolume.text = "\(currentValue)"
    }
    
    @IBAction func channelNumbers(sender: UIButton) {
        var channels = sender.currentTitle
        if typedNum == true {
            currentChannel.text = currentChannel.text! + channels!
        }
        else {
            currentChannel.text = channels;
        }
        typedNum = true
    }
    
    @IBAction func clearChanNumbers(sender: UIButton) {
        typedNum = false
        currentChannel.text = " "
        speakerVolume.text = " "
    }
    
    @IBAction func channelUpDown(sender: UIStepper) {
        currentChannel.text = " \(Int(sender.value))"
    }
    
    @IBAction func favChannel(sender: UISegmentedControl) {
        var station = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        currentChannel.text = station
        if station == "1" {
            currentChannel.text = "7"
        }
        if station == "2" {
            currentChannel.text = "5"
        }
        if station == "3" {
            currentChannel.text = "2"
        }
        if station == "4" {
            currentChannel.text = "32"
        }
    }
    
    @IBAction func mainPower(sender: UISegmentedControl) {
        let enabled = (sender.selectedSegmentIndex == 0)
        tvPower.enabled = enabled
        speakerVolume.enabled = enabled
        currentChannel.enabled = enabled
        volSliderOutlet.enabled = enabled
        favOutlet.enabled = enabled
        channelUpDownOut.enabled = enabled
        channelsOutlet.enabled = enabled
        leftSwitch.enabled = enabled
        
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

