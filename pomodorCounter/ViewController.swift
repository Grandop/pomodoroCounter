//
//  ViewController.swift
//  pomodorCounter
//
//  Created by Pedro Grando on 31/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    //var isTimerStarted = false
    var time = 1500
    
    
    @IBOutlet weak var chossingTechnique: UISegmentedControl!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var buttonActionOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func choiceTechniques(_ sender: UISegmentedControl) {
        defineOption()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {

        if (buttonActionOutlet.titleLabel?.text == "Start") {
            setTime()
            sender.setTitle("Stop", for: .normal)
            
        } else if (buttonActionOutlet.titleLabel?.text == "Stop") {
            timer.invalidate()
            sender.setTitle("Start", for: .normal)
            
        } else if (buttonActionOutlet.titleLabel?.text == "OK") {
            sender.setTitle("Start", for: .normal)
            defineOption()
        }
    }
    
    func setTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)

    }
    
    @objc func updateTimer() {
        time -= 1
        timeLabel.text = formatTime()
    }
    
    func formatTime() -> String {
        
        if time == 0 {
            timer.invalidate()
            buttonActionOutlet.setTitle("OK", for: .normal)
        } else {
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String(format:"%02i:%02i", minutes, seconds)
        }
            return "00:00"
        }

    func defineOption() {
        switch chossingTechnique.selectedSegmentIndex {
        case 0:
            timeLabel.text = "25:00"
            time = 1500//1500
            timer.invalidate()
            buttonActionOutlet.setTitle("Start", for: .normal)
        case 1:
            timeLabel.text = "05:00"
            time = 300//300
            timer.invalidate()
            buttonActionOutlet.setTitle("Start", for: .normal)
        case 2:
            timeLabel.text = "15:00"
            time = 900//900
            timer.invalidate()
            buttonActionOutlet.setTitle("Start", for: .normal)
        default:
            print("...")
        }
    }
    
}
