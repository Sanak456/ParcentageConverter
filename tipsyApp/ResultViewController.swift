//
//  ResultViewController.swift
//  tipsyApp
//
//  Created by Sanak Ghosh on 4/19/21.
//

import UIKit

class ResultViewController: UIViewController {

    var resultLblTitle = ""
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = resultLblTitle
    }
    
    @IBAction func reCalculate(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
