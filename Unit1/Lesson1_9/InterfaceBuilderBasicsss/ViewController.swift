//
//  ViewController.swift
//  InterfaceBuilderBasicsss
//
//  Created by Joyer on 11/2/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func  buttonPressed(_ sender: UIButton) {
        myLabel.text = " You pressed the button!"
    }
}
