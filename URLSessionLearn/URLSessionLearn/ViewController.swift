//
//  ViewController.swift
//  URLSessionLearn
//
//  Created by yangtz on 2024/1/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func randomRequest(_ sender: Any) {
        Networker.shared.getQuote { (saying: Saying?, error: Error?) -> (Void) in
            if let error = error {
                self.label.text = "Error"
                return
            }
            self.label.text = saying?.quote
        }
    }
    
}

