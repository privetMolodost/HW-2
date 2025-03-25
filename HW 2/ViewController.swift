//
//  ViewController.swift
//  HW 2
//
//  Created by Alexander Shprits on 25.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var actionButton: UIButton!
    
    enum TrafficLightStatus {
        case turnedOff
        case turnedRed
        case turnedYellow
        case turnedGreen
    }
    
    private var switchedOff = 0.3
    private var switchedOn = 1.0
    private var cornerRadius = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.layer.cornerRadius = 10
        redLight.layer.cornerRadius = cornerRadius
        redLight.alpha = switchedOff
        
        yellowLight.layer.cornerRadius = cornerRadius
        yellowLight.alpha = switchedOff
        
        greenLight.layer.cornerRadius = cornerRadius
        greenLight.alpha = switchedOff
    }
    
    var currentStatus: TrafficLightStatus = .turnedGreen
    
    @IBAction func trafficButtonDidTapped(_ sender: UIButton) {
        
            switch currentStatus {
            case .turnedOff:
                greenLight.alpha = switchedOff
                currentStatus = .turnedRed
                sender.setTitle("Start", for: .normal)
            case .turnedRed:
                redLight.alpha = switchedOn
                currentStatus = .turnedYellow
                sender.setTitle("Next", for: .normal)
            case .turnedYellow:
                redLight.alpha = switchedOff
                yellowLight.alpha = switchedOn
                currentStatus = .turnedGreen
                sender.setTitle("Next", for: .normal)
            case .turnedGreen:
                yellowLight.alpha = switchedOff
                greenLight.alpha = switchedOn
                currentStatus = .turnedOff
                sender.setTitle("Stop", for: .normal)
            }
        }
    }

