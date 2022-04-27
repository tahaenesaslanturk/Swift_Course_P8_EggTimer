//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer: Timer?
    var totalSec = 0
    var initSec = 0
    
    @IBOutlet weak var uiLabelText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        timer?.invalidate()
        progressBar.progress = 1.0
        
        switch hardness {
        case "Soft":
            totalSec = eggTimes["Soft"]! // * 60
            initSec = eggTimes["Soft"]! // * 60
        case "Medium":
            totalSec = eggTimes["Medium"]! //* 60
            initSec = eggTimes["Medium"]! //* 60
        case "Hard":
            totalSec = eggTimes["Hard"]! // * 60
            initSec = eggTimes["Hard"]! // * 60
        default:
            print("Error")
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
    }
    
    @objc func countDown() {
        totalSec -= 1
        print(totalSec)
        progressBar.progress = Float(totalSec) / Float(initSec)
        if totalSec == 0 {
            uiLabelText.text = "Done"
        timer?.invalidate()
        }
    }
}
