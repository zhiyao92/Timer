//
//  ViewController.swift
//  Timer
//
//  Created by Kelvin on 3/15/17.
//  Copyright © 2017 Kelvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0.0
    var time = Timer()
    var isCounting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startPressed(_ sender: Any) {
        if (isCounting){
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.startCounting), userInfo: nil, repeats: true)
        isCounting = true
    }

    @IBAction func pausePressed(_ sender: Any) {
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        time.invalidate()
        isCounting = false
    }
    

    
    @IBAction func resetPressed(_ sender: Any) {
        isCounting = false
        time.invalidate()
        counter = 0
        timeLabel.text = String(counter)
        startButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    
    func startCounting() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
}

