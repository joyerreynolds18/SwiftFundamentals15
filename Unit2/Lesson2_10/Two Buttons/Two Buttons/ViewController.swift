//
//  ViewController.swift
//  Two Buttons
//
//  Created by Joyer on 11/30/25.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        label.text = "Placeholder"
        
        
        
        
        
    }
    
            
    @IBAction func setTextButtonTapped(_
        sender: UIButton) {
        
        label.text = textField.text
        
        
        
        
        
        
        
    }
    
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        
        textField.text = ""
        label.text = ""
        
        
        
    }
    
    }
    

        
        
        
    



