//
//  ViewController.swift
//  Guided Project Light
//
//  Created by Joyer on 11/9/25.
//

import UIKit

class ViewController: UIViewController {
    // State flag, not an outlet
    var lightOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // Runs every time the button is tapped or on load
    fileprivate func updateUI() {
        if lightOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}
