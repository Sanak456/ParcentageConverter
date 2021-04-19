//
//  ViewController.swift
//  tipsyApp
//
//  Created by Sanak Ghosh on 4/19/21.
//

import UIKit

class ViewController: UIViewController {

    var tip = 0.0
    var count = 1
    var total = ""
    
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var zeroButton: UIButton!
    
    @IBOutlet var tenButton: UIButton!
    
    @IBOutlet var twoentyButton: UIButton!
    
    @IBOutlet var lbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initializeHideKeyboard()
        
    }

    
    @IBAction func steperChanged(_ sender: UIStepper) {
        
        lbl.text = String(format: "%.0f", sender.value)
        
        self.count = Int(String(format: "%.0f", sender.value))!
    }
    
    
    
    @IBAction func check(_ sender: UIButton) {
        
        
         
        let calculation = String(format: "%.2f", Double(textField.text!)! * (1+self.tip) / Double(count))
        
            
        total = calculation
        
        print(calculation)
        
        performSegue(withIdentifier: "goResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goResult" {
            
            let destinationVC = segue.destination as! ResultViewController

            destinationVC.resultLblTitle = total
            
        }
        
    }
    
    @IBAction func tipButtonPresss(_ sender: UIButton) {
        
        textField.endEditing(true)
        
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twoentyButton.isSelected = false
       // sender.backgroundColor = .green
        sender.isSelected = true
        let title = String(sender.currentTitle!)
        
        let tip = Double(title.dropLast())!/100
        print(tip)
        self.tip = tip
    
    }
    
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
 }

